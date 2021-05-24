library review_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/models/review.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/redux/app_state.dart';

import 'package:redux/redux.dart';

part 'review_view_model.g.dart';

abstract class ReviewViewModel
    implements Built<ReviewViewModel, ReviewViewModelBuilder> {
  // fields go here
  BuiltList<Review> get reviews;
  BuiltList<User> get users;
  BuiltList<Course> get courses;

  ReviewViewModel._();

  factory ReviewViewModel([updates(ReviewViewModelBuilder b)]) =
      _$ReviewViewModel;

  static ReviewViewModel fromStore(Store<AppState> store) {
    return ReviewViewModel(
      (h) => h
        ..reviews = ListBuilder(store.state.reviews)
        ..courses = ListBuilder(store.state.courses)
        ..users = ListBuilder(store.state.users),
    );
  }

  // static List<Review> _getLecturerReviews(
  //     Store<AppState> store, String lecturerId) {
  //   return store.state.reviews
  //       .where((review) => review.lecturerId == lecturerId)
  //       .toList();
  // }

  // static UserBuilder _getUser(Store<AppState> store) {
  //   if (store.state.user != null) {
  //     return store.state.user.toBuilder();
  //   }
  //   return null;
  // }
}
