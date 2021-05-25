import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/presentation/common/user_avatar.dart';
import 'package:lrsadmin/presentation/lecturers/arguments/add_lecturer_argument.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/lecturer/lecturer_action.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../routes.dart';
import '../../utils/string_extension.dart';
import 'dialogues.dart';

class LecturerContainer extends StatelessWidget {
  final Lecturer lecturer;
  final faculty;
  final double rating;
  const LecturerContainer({Key key, this.lecturer, this.faculty, this.rating})
      : super(key: key);

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
                        _buildBottomModalSheetListTile(context, lecturer.uid));
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

  Widget _buildBottomModalSheetListTile(BuildContext context, lecturerId) {
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
      ],
    );
  }
}
