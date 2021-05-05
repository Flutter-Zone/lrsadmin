import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddReview {
  final String comment;
  final double rating;
  final String lecturerCourseId;
  final String lecturerId;
  final String courseId;
  final String userId;
  final Timestamp createdAt;
  final List<Map<String, dynamic>> questions;
  final Completer completer;

  AddReview({
    this.comment,
    this.rating,
    this.lecturerCourseId,
    this.lecturerId,
    this.courseId,
    this.userId,
    this.createdAt,
    this.questions,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateReview {
  final String comment;
  final double rating;
  final String reviewId;
  final List<Map<String, dynamic>> questions;
  final Completer completer;

  UpdateReview(
      {this.comment,
      this.rating,
      this.reviewId,
      this.questions,
      Completer completer})
      : completer = completer ?? Completer();
}

class DeleteReview {
  final String reviewId;
  final Completer completer;

  DeleteReview({this.reviewId, Completer completer})
      : completer = completer ?? Completer();
}
