import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/file_repository.dart';
import 'package:lrsadmin/data/lecturer_repository.dart';
import 'package:lrsadmin/redux/attachment/image_processor.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';
import '../../data/lecturer_course_repository.dart';
import '../../data/course_repository.dart';
import '../stream_subscriptions.dart';
import './lecturer_action.dart';
import '../../models/lecturer_course.dart';
import '../../models/course.dart';

List<Middleware<AppState>> createLecturerMiddleware(
  LecturerCourseRepository lecturerCoursesRepository,
  CourseRepository courseRepository,
  LecturerRepository lecturerRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return [
    TypedMiddleware<AppState, FetchLecturerCourses>(
      _loadLectureCoursData(lecturerCoursesRepository, courseRepository),
    ),
    TypedMiddleware<AppState, AddLecturer>(
        _addLecturer(lecturerRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, UpdateLecturer>(
        _updateLecturer(lecturerRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, DeleteLecturer>(
        _deleteLecturer(lecturerRepository)),
  ];
}

void Function(
  Store<AppState> store,
  FetchLecturerCourses action,
  NextDispatcher next,
) _loadLectureCoursData(
  LecturerCourseRepository lecturerCoursesRepository,
  CourseRepository courseRepository,
) {
  return (store, action, next) async {
    next(action);
    List<Course> courses = [];
    try {
      lecturerCoursesSubscription?.cancel();
      lecturerCoursesSubscription = lecturerCoursesRepository
          .getLecturerCoursesStream(action.lecturerId)
          .listen(
        (List<LecturerCourse> lecturerCourses) async {
          for (int i = 0; i < lecturerCourses.length; i++) {
            final course =
                await courseRepository.getCourse(lecturerCourses[i].courseId);
            courses.add(course);
          }
          store.dispatch(
            OnLecturerCoursesLoaded(lecturerCourses, courses),
          );
        },
      );
    } catch (e) {
      print("Something terrible just happened: $e");
    }
  };
}

void Function(
  Store<AppState> store,
  AddLecturer action,
  NextDispatcher next,
) _addLecturer(
  LecturerRepository lecturerRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return (store, action, next) async {
    next(action);

    try {
      final file = await imageProcessor.cropAndResizeAvatar(action.file);
      final url = await repository.uploadFile(file);

      await lecturerRepository.addLecturer(
        action.email,
        action.fullname,
        url,
        action.phone,
        action.faculty,
      );

      action.completer.complete("Lecturer added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add lecturer");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add lecturer");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateLecturer action,
  NextDispatcher next,
) _updateLecturer(
  LecturerRepository lecturerRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return (store, action, next) async {
    next(action);
    try {
      String url = action.image;

      if (action.file != null) {
        final file = await imageProcessor.cropAndResizeAvatar(action.file);
        url = await repository.uploadFile(file);
      }

      await lecturerRepository.updateLecturer(
        action.email,
        action.fullname,
        url,
        action.phone,
        action.faculty,
        action.lecturerId,
      );

      action.completer.complete("Lecturer updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update lecturer");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update lecturer");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteLecturer action,
  NextDispatcher next,
) _deleteLecturer(
  LecturerRepository lecturerRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await lecturerRepository.deleteLecturer(action.lecturerId);
      action.completer.complete("Lecturer deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete lecturer");
    } catch (error) {
      action.completer.completeError("Oops! Failed to delete lecturer");
    }
  };
}
