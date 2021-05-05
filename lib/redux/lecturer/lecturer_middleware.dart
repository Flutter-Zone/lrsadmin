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
) {
  return [
    TypedMiddleware<AppState, FetchLecturerCourses>(
      _loadLectureCoursData(
        lecturerCoursesRepository,
        courseRepository,
      ),
    ),
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
