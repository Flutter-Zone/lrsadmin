import 'dart:async';

class AddFaculty {
  final String name;
  final String description;
  final String image;
  final Completer completer;

  AddFaculty({
    this.name,
    this.description,
    this.image,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateFaculty {
  final String name;
  final String description;
  final String image;
  final String facultyId;
  final Completer completer;

  UpdateFaculty(
      {this.name,
      this.description,
      this.image,
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
