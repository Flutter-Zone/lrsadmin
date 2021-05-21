import 'dart:async';

class AddCourse {
  final String title;
  final String description;
  final double creditHours;
  final Completer completer;

  AddCourse({
    this.title,
    this.description,
    this.creditHours,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateCourse {
  final String title;
  final String description;
  final double creditHours;
  final String courseId;
  final Completer completer;

  UpdateCourse(
      {this.title,
      this.description,
      this.creditHours,
      this.courseId,
      Completer completer})
      : completer = completer ?? Completer();
}

class DeleteCourse {
  final String courseId;
  final Completer completer;

  DeleteCourse({this.courseId, Completer completer})
      : completer = completer ?? Completer();
}
