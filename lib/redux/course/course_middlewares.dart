import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/course_repository.dart';
import 'package:lrsadmin/data/lecturer_course_repository.dart';
import 'package:lrsadmin/redux/course/course_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createCourseMiddleware(
  CourseRepository courseRepository,
  LecturerCourseRepository lecturerCourseRepository,
) {
  return [
    TypedMiddleware<AppState, AddCourse>(_addCourse(courseRepository)),
    TypedMiddleware<AppState, UpdateCourse>(_updateCourse(courseRepository)),
    TypedMiddleware<AppState, DeleteCourse>(
        _deleteCourse(courseRepository, lecturerCourseRepository)),
    TypedMiddleware<AppState, DeleteLecturerCourse>(
        _deleteLecturerCourse(lecturerCourseRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddCourse action,
  NextDispatcher next,
) _addCourse(
  CourseRepository courseRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await courseRepository.addCourse(
          action.title, action.description, action.creditHours);
      action.completer.complete("Course added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add course");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add course");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateCourse action,
  NextDispatcher next,
) _updateCourse(
  CourseRepository courseRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await courseRepository.updateCourse(action.title, action.description,
          action.creditHours, action.courseId);
      action.completer.complete("Course updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update course");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update course");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteCourse action,
  NextDispatcher next,
) _deleteCourse(
  CourseRepository courseRepository,
  LecturerCourseRepository lecturerCourseRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await courseRepository.deleteCourse(action.courseId);
      await lecturerCourseRepository.deleteLecturerCourse(action.courseId);

      action.completer.complete("Course deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete course");
    } catch (error) {
      print('something happened: $error');
      action.completer.completeError("Oops! Failed to delete course");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteLecturerCourse action,
  NextDispatcher next,
) _deleteLecturerCourse(
  LecturerCourseRepository lecturerCourseRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await lecturerCourseRepository.deleteLecturerCourse(action.courseId);

      action.completer.complete("Course unassigned successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to unassign course");
    } catch (error) {
      print('something happened: $error');
      action.completer.completeError("Oops! Failed to unassign course");
    }
  };
}
