import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review.dart';
import 'firebase_paths.dart';

class ReviewRepository {
  static const USER_ID = "user_id";
  static const LECTURER_COURSE_ID = "lecturer_course_id";
  static const COMMENT = "comment";
  static const RATING = "rating";
  static const LECTURER_ID = "lecturer_id";
  static const COURSE_ID = "course_id";
  static const CREATED_AT = "createdAt";
  static const QUESTIONS = "questions";

  final FirebaseFirestore _firebaseFirestore;

  const ReviewRepository(this._firebaseFirestore);

  Stream<List<Review>> getLecturerCourseReviewsStream(lecturerId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_REVIEWS)
        .where("lecturer_id", isEqualTo: lecturerId)
        .snapshots()
        .map(
      (lecturerCourseReviewsSnapshot) {
        final lecturerCourseReviews =
            lecturerCourseReviewsSnapshot.docs.map(fromDoc).toList();
        return lecturerCourseReviews;
      },
    );
  }

  Stream<List<Review>> getReviewsStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_REVIEWS)
        .snapshots()
        .map((reviewsSnapshot) {
      final reviews = reviewsSnapshot.docs.map(fromDoc).toList();
      reviews.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return reviews;
    });
  }

  Future<void> addReview(comment, rating, lecturerCourseId, lecturerId,
      courseId, userId, timeStamp, questions) async {
    CollectionReference reviews =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_REVIEWS);
    return reviews.add({
      'comment': comment,
      'rating': rating,
      'lecturer_course_id': lecturerCourseId,
      'lecturer_id': lecturerId,
      'course_id': courseId,
      'user_id': userId,
      'questions': questions,
      'createdAt': timeStamp,
    });
  }

  Future<void> updateReview(comment, rating, reviewId, questions) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.reviewPath(reviewId));
    return documentReference.update({
      COMMENT: comment,
      RATING: rating,
      QUESTIONS: questions,
    });
  }

  Future<void> deleteReview(reviewId) {
    CollectionReference reviews =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_REVIEWS);

    return reviews.doc(reviewId).delete();
  }

  static Review fromDoc(DocumentSnapshot document) {
    return Review(
      (r) => r
        ..uid = document.id
        ..userId = document[USER_ID]
        ..lecturerCourseId = document[LECTURER_COURSE_ID]
        ..lecturerId = document[LECTURER_ID]
        ..courseId = document[COURSE_ID]
        ..comment = document[COMMENT]
        ..createdAt = document[CREATED_AT]
        ..questions = ListBuilder<Map<String, dynamic>>(document[QUESTIONS])
        ..rating = document[RATING],
    );
  }
}
