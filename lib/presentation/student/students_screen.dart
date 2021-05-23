import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/student/arguments/add_student_argument.dart';
import 'package:lrsadmin/presentation/student/viewmodels/student_view_model.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/student/student_action.dart';
import 'package:lrsadmin/routes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../presentation/common/not_found.dart';
import '../../presentation/common/user_avatar.dart';
import '../../utils/string_extension.dart';

class StudentsScreen extends StatefulWidget {
  StudentsScreen({Key key}) : super(key: key);

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBarWidget(),
      body: _buildLecturersListView(),
    );
  }

  Widget _buildAppBarWidget() {
    String title = "Students";
    return AppBar(
      backgroundColor: white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        "$title",
        style: TextStyle(color: black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Ionicons.close,
          color: colorPrimary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(Ionicons.add_outline, color: colorPrimary),
          onPressed: () async {
            final message =
                await Navigator.of(context).pushNamed(Routes.addStudent);
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
      ],
    );
  }

  Widget _buildLecturersListView() {
    return 1 <= 0
        ? NotFound(
            info:
                "Sorry!, we couldn't find any students on the database. Please add some students",
            child: CustomButton(
              buttonText: "Add Student",
              onPressedCallback: () async {
                final message =
                    await Navigator.of(context).pushNamed(Routes.addStudent);
                if (message != null) {
                  showNoContextToast(successToastColor, message);
                }
              },
            ),
          )
        : StoreConnector<AppState, StudentsViewModel>(
            builder: (ctx, vm) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return;
                },
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                  itemCount: vm.users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildStudentContainer(vm.users[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 10.0,
                    indent: 85.0,
                  ),
                ),
              );
            },
            converter: StudentsViewModel.fromStore,
          );
  }

  Widget _buildBottomModalSheetListTile(studentId) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Edit'),
          leading: Icon(Icons.edit),
          onTap: () async {
            Navigator.of(context).pop();
            final message = await Navigator.of(context).pushNamed(
              Routes.addStudent,
              arguments: AddStudentArgument(studentId),
            );
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
        ListTile(
          title: Text('Delete'),
          leading: Icon(Ionicons.trash_outline),
          onTap: () {
            Navigator.of(context).pop();
            showLoadingDialog(context);
            final _deleteStudentAction = DeleteStudent(studentId: studentId);
            StoreProvider.of<AppState>(context).dispatch(_deleteStudentAction);
            _deleteStudentAction.completer.future.then(
              (message) {
                Navigator.of(context).pop();
                showNoContextToast(successToastColor, message);
              },
            );

            _deleteStudentAction.completer.future.catchError((message) {
              Navigator.of(context).pop();
              showNoContextToast(errorToastColor, message);
            });
          },
        ),
      ],
    );
  }

  Widget _buildStudentContainer(User user) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar(
              imageUrl: "${user.image}",
              size: 70,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${user.name.capitalize()}",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 16,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    "${user.email}",
                    maxLines: 1,
                    minFontSize: 14,
                    maxFontSize: 14,
                    style: TextStyle(
                      color: grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  AutoSizeText(
                    "${user.phone}",
                    maxLines: 1,
                    minFontSize: 14,
                    maxFontSize: 14,
                    style: TextStyle(
                      color: colorSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showBarModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        _buildBottomModalSheetListTile(user.uid));
              },
              child: Icon(
                Ionicons.ellipsis_vertical_outline,
                color: grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
