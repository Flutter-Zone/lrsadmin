import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/comment.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/common/user_avatar.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/comment/comment_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../models/user.dart';
import '../../../utils/convert_timestamps.dart';
import '../../../utils/string_extension.dart';
import '../../../constants/colors.dart';

class CommentContainer extends StatefulWidget {
  final Comment comment;
  final User user;
  final GlobalKey<ScaffoldState> globalKey;
  const CommentContainer({Key key, this.comment, this.user, this.globalKey})
      : super(key: key);
  @override
  CommentContainerState createState() => CommentContainerState();
}

class CommentContainerState extends State<CommentContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserAvatar(
            imageUrl: "${widget.user.image}",
            size: 60,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTopContainer(),
                    GestureDetector(
                      onTap: () {
                        showBarModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                _buildBottomModalSheetListTile());
                      },
                      child: Icon(
                        Ionicons.ellipsis_vertical,
                        color: grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${widget.comment.comment.capitalize()}",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopContainer() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.user.name}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateConverter.convertTimeStamp(widget.comment.createdAt),
            style: TextStyle(
              fontSize: 14.0,
              color: grey,
            ),
          ),
        ],
      ),
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
            Navigator.of(context).pop();
            // showLoadingDialog(context);
            final _deleteCommentAction =
                DeleteComment(commentId: widget.comment.uid);
            StoreProvider.of<AppState>(context).dispatch(_deleteCommentAction);
            _deleteCommentAction.completer.future.then(
              (message) {
                // Navigator.of(context).pop();
                showNoContextToast(successToastColor, message);
              },
            );
            _deleteCommentAction.completer.future.catchError((message) {
              Navigator.of(context).pop();
              showNoContextToast(errorToastColor, message);
            });
          },
        ),
      ],
    );
  }
}
