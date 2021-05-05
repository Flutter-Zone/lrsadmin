library comment;

import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> {
  // fields go here
  String get uid;
  String get userId;
  String get newsId;
  String get comment;
  Timestamp get createdAt;

  Comment._();

  factory Comment([updates(CommentBuilder b)]) = _$Comment;
}
