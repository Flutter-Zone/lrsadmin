import 'package:firebase_core/firebase_core.dart';
import '../../data/comment_repository.dart';
import '../../models/comment.dart';
import '../../redux/comment/comment_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createCommentMiddleware(
  CommentRepository commentRepository,
) {
  return [
    TypedMiddleware<AppState, AddComment>(_addComment(commentRepository)),
    TypedMiddleware<AppState, UpdateComment>(_updateComment(commentRepository)),
    TypedMiddleware<AppState, DeleteComment>(_deleteComment(commentRepository)),
    TypedMiddleware<AppState, FetchNewsComments>(
        _fetchNewsComment(commentRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddComment action,
  NextDispatcher next,
) _addComment(
  CommentRepository commentRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await commentRepository.addComment(
          action.comment, action.userId, action.newsId, action.createdAt);
      action.completer.complete("Comment added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add comment");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add comment");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateComment action,
  NextDispatcher next,
) _updateComment(
  CommentRepository commentRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await commentRepository.updateComment(action.comment, action.commentId);
      action.completer.complete("Comment updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update comment");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update comment");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteComment action,
  NextDispatcher next,
) _deleteComment(
  CommentRepository commentRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await commentRepository.deleteComment(action.commentId);
      action.completer.complete("Comment deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete comment");
    } catch (error) {
      action.completer.completeError("Oops! Failed to delete comment");
    }
  };
}

void Function(
  Store<AppState> store,
  FetchNewsComments action,
  NextDispatcher next,
) _fetchNewsComment(
  CommentRepository commentRepository,
) {
  return (store, action, next) async {
    next(action);
    commentRepository
        .getNewsComments(action.newsId)
        .listen((List<Comment> comments) {
      store.dispatch(OnNewsCommentLoaded(comments));
    });
  };
}
