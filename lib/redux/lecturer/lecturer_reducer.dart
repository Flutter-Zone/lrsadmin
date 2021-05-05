import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import '../../redux/lecturer/lecturer_action.dart';

import '../app_state.dart';

final lecturerReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnLecturerCoursesLoaded>(_onLecturerCoursesUpdate)
];

AppState _onLecturerCoursesUpdate(
    AppState state, OnLecturerCoursesLoaded action) {
  return state.rebuild((a) => a
    ..lecturerCourses = ListBuilder(action.lecturerCourses)
    ..courses = ListBuilder(action.courses));
}
