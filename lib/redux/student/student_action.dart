import 'dart:async';
import 'dart:io';

class AddStudent {
  final File file;
  final String email;
  final String name;
  final String phone;
  final String password;
  final Completer completer;

  AddStudent({
    this.file,
    this.email,
    this.name,
    this.phone,
    this.password,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateStudent {
  final File file;
  final String email;
  final String name;
  final String phone;
  final String image;
  final String studentId;
  final Completer completer;

  UpdateStudent({
    this.file,
    this.email,
    this.name,
    this.phone,
    this.image,
    this.studentId,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class DeleteStudent {
  final String studentId;
  final Completer completer;

  DeleteStudent({this.studentId, Completer completer})
      : completer = completer ?? Completer();
}
