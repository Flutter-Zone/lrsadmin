import 'dart:async';
import 'dart:io';
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

class AddLecturer {
  final File file;
  final String email;
  final String fullname;
  final String image;
  final String phone;
  final String faculty;
  final Completer completer;

  AddLecturer({
    this.file,
    this.email,
    this.fullname,
    this.image,
    this.phone,
    this.faculty,
    Completer completer,
  }) : completer = completer ?? Completer();
}
