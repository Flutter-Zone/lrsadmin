import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/presentation/assign_course_to_lecturer_argument.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/common/search_lecturers.dart';
import 'package:lrsadmin/presentation/lecturers/viewmodels/lecturers_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/lecturer/lecturer_action.dart';
import 'package:lrsadmin/routes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../presentation/common/not_found.dart';
import '../../presentation/common/user_avatar.dart';
import '../../utils/string_extension.dart';
import './arguments/add_lecturer_argument.dart';

class LecturersScreen extends StatefulWidget {
  LecturersScreen({Key key}) : super(key: key);

  @override
  _LecturersScreenState createState() => _LecturersScreenState();
}

class _LecturersScreenState extends State<LecturersScreen> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LecturersViewModel>(
      builder: (ctx, vm) {
        return Scaffold(
          backgroundColor: white,
          appBar: _buildAppBarWidget(vm),
          body: _buildLecturersListView(vm),
        );
      },
      converter: LecturersViewModel.fromStore,
      distinct: true,
    );
  }

  Widget _buildAppBarWidget(LecturersViewModel vm) {
    String title = "Lecturers";
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
                await Navigator.of(context).pushNamed(Routes.addLecturer);
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
        IconButton(
          onPressed: () {
            showSearch(
                context: context,
                delegate: LecturersSearch(vm.lecturers.toList()));
          },
          icon: Icon(
            Icons.search,
            color: colorPrimary,
          ),
        )
      ],
    );
  }

  Widget _buildLecturersListView(LecturersViewModel vm) {
    return 1 <= 0
        ? NotFound(
            info:
                "Sorry!, we couldn't find any lecturers on the database. Please add some lecturers",
            child: CustomButton(
              buttonText: "Add Lecturer",
              onPressedCallback: () {},
            ),
          )
        : NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              itemCount: vm.lecturers.length,
              itemBuilder: (BuildContext context, int index) {
                final faculty = getFaculty(
                    vm.faculties.toList(), vm.lecturers[index].facultyId);
                final rating = getAverageRating(
                    vm.reviews.toList(), vm.lecturers[index].uid);
                return _buildLecturerContainer(
                    vm.lecturers[index], faculty, rating);
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 10.0,
                indent: 85.0,
              ),
            ),
          );
  }

  Widget _buildBottomModalSheetListTile(lecturerId) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Edit'),
          leading: Icon(Icons.edit),
          onTap: () async {
            Navigator.of(context).pop();
            final message = await Navigator.of(context).pushNamed(
              Routes.addLecturer,
              arguments: AddLecturerArgument(lecturerId),
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
            final _deleteLecturerAction =
                DeleteLecturer(lecturerId: lecturerId);
            StoreProvider.of<AppState>(context).dispatch(_deleteLecturerAction);
            _deleteLecturerAction.completer.future.then(
              (message) {
                Navigator.of(context).pop();
                showNoContextToast(successToastColor, message);
              },
            );

            _deleteLecturerAction.completer.future.catchError((message) {
              Navigator.of(context).pop();
              showNoContextToast(errorToastColor, message);
            });
          },
        ),
        ListTile(
          title: Text('Assing courses'),
          leading: Icon(Ionicons.book_outline),
          onTap: () async {
            Navigator.of(context).pop();
            final message = await Navigator.of(context).pushNamed(
              Routes.assignCourseToLecturer,
              arguments: AssignCourseToLecturerArgument(lecturerId),
            );
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
      ],
    );
  }

  Widget _buildLecturerContainer(Lecturer lecturer, faculty, double rating) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatar(
              imageUrl: "${lecturer.image}",
              size: 70,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "${lecturer.name.capitalize()}",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 16,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    "${lecturer.email}",
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
                    "${faculty.name.toUpperCase()}",
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
            Row(
              children: [
                Icon(
                  Icons.star_sharp,
                  color: starColor,
                ),
                Text(
                  rating.isNaN ? "0.0" : "${rating.toStringAsFixed(1)}",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                showBarModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) =>
                        _buildBottomModalSheetListTile(lecturer.uid));
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
