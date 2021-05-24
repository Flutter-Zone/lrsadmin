import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/not_found.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/app_state.dart';

import 'comment/comment_view_model.dart';
import 'widgets/comment_container.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key key}) : super(key: key);
  @override
  CommentsScreenState createState() => CommentsScreenState();
}

class CommentsScreenState extends State<CommentsScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CommentViewModel>(
      builder: (context, vm) {
        return Scaffold(
          key: _globalKey,
          backgroundColor: white,
          appBar: _buildAppBarWidget(context),
          body: _buildScaffoldBody(vm),
        );
      },
      converter: CommentViewModel.fromStore,
      distinct: true,
    );
  }

  Widget _buildScaffoldBody(CommentViewModel vm) {
    return vm.comments.length <= 0
        ? NotFound(
            info: "Sorry!, we couldn't find any comments.",
          )
        : ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            itemCount: vm.comments.length,
            itemBuilder: (BuildContext context, int index) {
              final theCommentUser =
                  getUser(vm.users.toList(), vm.comments[index].userId);
              return CommentContainer(
                comment: vm.comments[index],
                user: theCommentUser,
                globalKey: _globalKey,
              );
            },
            separatorBuilder: (context, index) => Divider(),
          );
  }

  Widget _buildAppBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: white,
      elevation: 0.5,
      title: Text(
        "Comments",
        style: TextStyle(
          color: black,
          fontSize: 20.0,
        ),
      ),
      iconTheme: IconThemeData(color: black),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Ionicons.close_outline,
          color: colorPrimary,
          size: 24.0,
        ),
      ),
    );
  }
}
