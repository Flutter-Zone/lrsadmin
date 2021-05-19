import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/lecturers/viewmodels/lecturers_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../presentation/common/not_found.dart';
import '../../presentation/common/user_avatar.dart';
import '../../utils/string_extension.dart';

class LecturersScreen extends StatefulWidget {
  LecturersScreen({Key key}) : super(key: key);

  @override
  _LecturersScreenState createState() => _LecturersScreenState();
}

class _LecturersScreenState extends State<LecturersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBarWidget(),
      body: _buildLecturersListView(),
    );
  }

  Widget _buildAppBarWidget() {
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
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLecturersListView() {
    return 1 <= 0
        ? NotFound(
            info:
                "Sorry!, we couldn't find any lecturers on the database. Please add some lecturers",
            child: CustomButton(
              buttonText: "Add Lecturer",
              onPressedCallback: () {},
            ),
          )
        : StoreConnector<AppState, LecturersViewModel>(
            builder: (ctx, vm) {
              return NotificationListener<OverscrollIndicatorNotification>(
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
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 10.0,
                    indent: 85.0,
                  ),
                ),
              );
            },
            converter: LecturersViewModel.fromStore,
          );
  }

  Widget _buildBottomModalSheetListTile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Edit'),
          leading: Icon(Icons.edit),
          onTap: () async {
            // Navigator.of(context).pop();
            // final message = await Navigator.of(context).pushNamed(
            //   Routes.course,
            //   arguments: CourseArgument(
            //     courseId: widget.review.courseId,
            //     lecturerId: widget.review.lecturerId,
            //     lecturerCourseId: widget.review.lecturerCourseId,
            //     review: widget.review,
            //     isAdding: false,
            //   ),
            // );
            // if (message != null) {
            //   showToast(
            //       fToast: fToast,
            //       icon: Ionicons.checkmark_outline,
            //       backgroundColor: successToastColor,
            //       message: message);
            // }
          },
        ),
        ListTile(
          title: Text('Delete'),
          leading: Icon(Ionicons.trash_outline),
          onTap: () {
            // Navigator.of(widget.globalKey.currentContext).pop();
            // showLoadingDialog(context);
            // final _deleteReviewAction =
            //     DeleteReview(reviewId: widget.review.uid);
            // StoreProvider.of<AppState>(context).dispatch(_deleteReviewAction);
            // _deleteReviewAction.completer.future.then(
            //   (message) {
            //     Navigator.of(widget.globalKey.currentContext).pop();
            //     showToast(
            //       fToast: fToast,
            //       icon: Ionicons.checkmark_outline,
            //       backgroundColor: successToastColor,
            //       message: message,
            //     );
            //   },
            // );

            // _deleteReviewAction.completer.future.catchError((message) {
            //   Navigator.of(widget.globalKey.currentContext).pop();
            //   showToast(
            //     fToast: fToast,
            //     icon: Ionicons.close_outline,
            //     backgroundColor: errorToastColor,
            //     message: message,
            //   );
            // });
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
              size: 80,
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
                  rating.isNaN ? "0.0" : "$rating",
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
                    builder: (context) => _buildBottomModalSheetListTile());
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
