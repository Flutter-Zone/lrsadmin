library assign_course_to_lecturer_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'assign_course_to_lecturer_view_model.g.dart';

abstract class AssignCourseToLecturerViewModel
    implements
        Built<AssignCourseToLecturerViewModel,
            AssignCourseToLecturerViewModelBuilder> {
  // fields go here
  BuiltList<Lecturer> get lecturers;
  BuiltList<Course> get courses;

  AssignCourseToLecturerViewModel._();

  factory AssignCourseToLecturerViewModel(
          [updates(AssignCourseToLecturerViewModelBuilder b)]) =
      _$AssignCourseToLecturerViewModel;
  static AssignCourseToLecturerViewModel fromStore(Store<AppState> store) {
    return AssignCourseToLecturerViewModel((a) => a
      ..lecturers = ListBuilder(store.state.lecturers)
      ..courses = ListBuilder(store.state.courses));
  }
}
