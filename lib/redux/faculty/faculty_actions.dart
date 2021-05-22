import 'dart:async';

import 'dart:io';

class AddFaculty {
  final File file;
  final String name;
  final String description;
  final Completer completer;

  AddFaculty({
    this.file,
    this.name,
    this.description,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateFaculty {
  final String name;
  final String description;
  final String image;
  final File file;
  final String facultyId;
  final Completer completer;

  UpdateFaculty(
      {this.name,
      this.description,
      this.image,
      this.file,
      this.facultyId,
      Completer completer})
      : completer = completer ?? Completer();
}

class DeleteFaculty {
  final String facultyId;
  final Completer completer;

  DeleteFaculty({this.facultyId, Completer completer})
      : completer = completer ?? Completer();
}
