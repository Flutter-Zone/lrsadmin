import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/presentation/common/user_avatar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../models/course.dart';
import '../../../models/review.dart';
import '../../../models/user.dart';
import '../../../presentation/common/dialogues.dart';
import '../../../redux/app_state.dart';
import '../../../redux/review/review_action.dart';
import '../../../utils/convert_timestamps.dart';
import '../../../constants/colors.dart';
import '../../../utils/string_extension.dart';

class ReviewContainer extends StatefulWidget {
  final Review review;
  final User user;

  final Course course;
  final GlobalKey<ScaffoldState> globalKey;
  const ReviewContainer(
      {Key key, this.review, this.user, this.course, this.globalKey})
      : super(key: key);
  @override
  ReviewContainerState createState() => ReviewContainerState();
}

class ReviewContainerState extends State<ReviewContainer> {
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(widget.globalKey.currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAvatar(imageUrl: "${widget.user.image}", size: 60),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTheTopContainer(),
                    _buildReview(),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${widget.review.comment.capitalize()}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                widget.review.comment.isNotEmpty
                    ? SizedBox(height: 16.0)
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Ionicons.star,
          size: 20.0,
          color: starColor,
        ),
        Text(
          "${widget.review.rating.toStringAsFixed(1)}",
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            showBarModalBottomSheet(
                expand: false,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => _buildBottomModalSheetListTile());
          },
          child: Icon(
            Ionicons.ellipsis_vertical,
            color: grey,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomModalSheetListTile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Delete'),
          leading: Icon(Ionicons.trash_outline),
          onTap: () {
            Navigator.of(widget.globalKey.currentContext).pop();
            showLoadingDialog(context);
            final _deleteReviewAction =
                DeleteReview(reviewId: widget.review.uid);
            StoreProvider.of<AppState>(context).dispatch(_deleteReviewAction);
            _deleteReviewAction.completer.future.then(
              (message) {
                Navigator.of(widget.globalKey.currentContext).pop();
                showToast(
                  fToast: fToast,
                  icon: Ionicons.checkmark_outline,
                  backgroundColor: successToastColor,
                  message: message,
                );
              },
            );

            _deleteReviewAction.completer.future.catchError((message) {
              Navigator.of(widget.globalKey.currentContext).pop();
              showToast(
                fToast: fToast,
                icon: Ionicons.close_outline,
                backgroundColor: errorToastColor,
                message: message,
              );
            });
          },
        ),
      ],
    );
  }

  Widget _buildTheTopContainer() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "${widget.user.name}",
              maxLines: 1,
              maxFontSize: 16,
              minFontSize: 16,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            AutoSizeText(
              "${widget.course.title.capitalizeWords()}",
              maxLines: 1,
              maxFontSize: 14,
              minFontSize: 14,
              style: TextStyle(
                color: colorSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateConverter.convertTimeStamp(widget.review.createdAt),
              style: TextStyle(
                fontSize: 14.0,
                color: grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
