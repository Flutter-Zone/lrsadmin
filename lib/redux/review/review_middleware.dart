import 'package:firebase_core/firebase_core.dart';
import '../../data/review_repository.dart';
import '../../redux/review/review_action.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createReviewMiddleware(
  ReviewRepository reviewRepository,
) {
  return [
    TypedMiddleware<AppState, AddReview>(_addReview(reviewRepository)),
    TypedMiddleware<AppState, UpdateReview>(_updateReview(reviewRepository)),
    TypedMiddleware<AppState, DeleteReview>(_deleteReview(reviewRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddReview action,
  NextDispatcher next,
) _addReview(
  ReviewRepository reviewRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await reviewRepository.addReview(
        action.comment,
        action.rating,
        action.lecturerCourseId,
        action.lecturerId,
        action.courseId,
        action.userId,
        action.createdAt,
        action.questions,
      );
      action.completer.complete("Review added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add review");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add review");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateReview action,
  NextDispatcher next,
) _updateReview(
  ReviewRepository reviewRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await reviewRepository.updateReview(
          action.comment, action.rating, action.reviewId, action.questions);
      action.completer.complete("Review updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update review");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update review");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteReview action,
  NextDispatcher next,
) _deleteReview(
  ReviewRepository reviewRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await reviewRepository.deleteReview(action.reviewId);
      action.completer.complete("Review deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete review");
    } catch (error) {
      action.completer.completeError("Oops! Failed to delete review");
    }
  };
}
