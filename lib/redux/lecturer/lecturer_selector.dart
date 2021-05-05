import '../../models/lecturer_course.dart';

LecturerCourse getLecturerCourse(
    List<LecturerCourse> lecturerCourses, String courseId) {
  return lecturerCourses.firstWhere(
      (lecturerCourse) => lecturerCourse.courseId == courseId,
      orElse: () => null);
}
