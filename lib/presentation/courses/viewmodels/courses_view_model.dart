library courses_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'courses_view_model.g.dart';

abstract class CoursesViewModel
    implements Built<CoursesViewModel, CoursesViewModelBuilder> {
  // fields go here
  BuiltList<Course> get courses;

  CoursesViewModel._();

  factory CoursesViewModel([updates(CoursesViewModelBuilder b)]) =
      _$CoursesViewModel;

  static CoursesViewModel fromStore(Store<AppState> store) {
    return CoursesViewModel(
        (c) => c..courses = ListBuilder(store.state.courses));
  }
}
