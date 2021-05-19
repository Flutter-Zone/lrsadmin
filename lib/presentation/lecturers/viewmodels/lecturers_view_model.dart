library lecturers_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import '../../../models/faculty.dart';
import '../../../models/review.dart';

import 'package:redux/redux.dart';

import '../../../models/lecturer.dart';
import '../../../redux/app_state.dart';

part 'lecturers_view_model.g.dart';

abstract class LecturersViewModel
    implements Built<LecturersViewModel, LecturersViewModelBuilder> {
  // fields go here
  BuiltList<Lecturer> get lecturers;
  BuiltList<Faculty> get faculties;
  BuiltList<Review> get reviews;
  double get averageRating;

  LecturersViewModel._();

  factory LecturersViewModel([updates(LecturersViewModelBuilder b)]) =
      _$LecturersViewModel;

  static LecturersViewModel fromStore(Store<AppState> store) {
    return LecturersViewModel(
      (l) => l
        ..lecturers = ListBuilder(store.state.lecturers)
        ..faculties = ListBuilder(store.state.faculties)
        ..reviews = ListBuilder(store.state.reviews)
        ..averageRating = _getAverageRating(store),
    );
  }

  static double _getAverageRating(Store<AppState> store) {
    double totalReview = 0.0;
    final reviews = store.state.reviews.toList();
    reviews.forEach((review) => totalReview += review.rating);

    return totalReview / reviews.length;
  }
}
