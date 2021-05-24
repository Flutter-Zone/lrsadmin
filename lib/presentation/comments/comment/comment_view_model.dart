library comment_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/comment.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'comment_view_model.g.dart';

abstract class CommentViewModel
    implements Built<CommentViewModel, CommentViewModelBuilder> {
  // fields go here
  BuiltList<Comment> get comments;
  BuiltList<User> get users;
  @nullable
  User get user;

  CommentViewModel._();

  factory CommentViewModel([updates(CommentViewModelBuilder b)]) =
      _$CommentViewModel;

  static CommentViewModel fromStore(Store<AppState> store) {
    return CommentViewModel(
      (c) => c
        ..comments = ListBuilder(store.state.comments)
        ..users = ListBuilder(store.state.users)
        ..user = _getUser(store),
    );
  }

  static UserBuilder _getUser(Store<AppState> store) {
    if (store.state.user != null) {
      return store.state.user.toBuilder();
    }
    return null;
  }
}
