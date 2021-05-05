import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/comment.dart';

class AddComment {
  final String comment;
  final String newsId;
  final String userId;
  final Timestamp createdAt;
  final Completer completer;

  AddComment({
    this.comment,
    this.newsId,
    this.userId,
    this.createdAt,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class FetchNewsComments {
  final String newsId;
  Completer completer;

  FetchNewsComments({this.newsId, Completer completer})
      : completer = completer ?? Completer();
}

class OnNewsCommentLoaded {
  final List<Comment> comments;

  OnNewsCommentLoaded(this.comments);
}

class UpdateComment {
  final String comment;
  final String commentId;
  final Completer completer;

  UpdateComment({this.comment, this.commentId, Completer completer})
      : completer = completer ?? Completer();
}

class DeleteComment {
  final String commentId;
  final Completer completer;

  DeleteComment({this.commentId, Completer completer})
      : completer = completer ?? Completer();
}
