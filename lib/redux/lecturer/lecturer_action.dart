import '../../models/lecturer_course.dart';
import '../../models/course.dart';

class FetchLecturerCourses {
  final String lecturerId;

  FetchLecturerCourses(this.lecturerId);
}

class OnLecturerCoursesLoaded {
  final List<LecturerCourse> lecturerCourses;
  final List<Course> courses;

  const OnLecturerCoursesLoaded(this.lecturerCourses, this.courses);

  @override
  String toString() {
    return "OnLecturerCoursesLoaded{lecturerCourses: $lecturerCourses}";
  }
}
