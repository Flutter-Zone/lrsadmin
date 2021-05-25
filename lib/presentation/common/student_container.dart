import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/common/user_avatar.dart';
import 'package:lrsadmin/presentation/student/arguments/add_student_argument.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/student/student_action.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../routes.dart';
import '../../utils/string_extension.dart';

class StudentContainer extends StatelessWidget {
  final User user;

  const StudentContainer({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        _buildBottomModalSheetListTile(context, user.uid));
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

  Widget _buildBottomModalSheetListTile(BuildContext context, studentId) {
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
}
