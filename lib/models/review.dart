library review;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'review.g.dart';

abstract class Review implements Built<Review, ReviewBuilder> {
  // fields go here
  String get uid;
  String get userId;
  String get lecturerCourseId;
  String get courseId;
  String get lecturerId;
  String get comment;
  double get rating;
  BuiltList<Map<String, dynamic>> get questions;
  Timestamp get createdAt;

  Review._();

  factory Review([updates(ReviewBuilder b)]) = _$Review;
}
