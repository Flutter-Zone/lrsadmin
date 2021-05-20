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
  final String phone;
  final String faculty;
  final Completer completer;

  AddLecturer({
    this.file,
    this.email,
    this.fullname,
    this.phone,
    this.faculty,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateLecturer {
  final File file;
  final String email;
  final String fullname;
  final String phone;
  final String image;
  final String faculty;
  final String lecturerId;
  final Completer completer;

  UpdateLecturer({
    this.file,
    this.email,
    this.fullname,
    this.phone,
    this.image,
    this.faculty,
    this.lecturerId,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class DeleteLecturer {
  final String lecturerId;
  final Completer completer;

  DeleteLecturer({this.lecturerId, Completer completer})
      : completer = completer ?? Completer();
}
