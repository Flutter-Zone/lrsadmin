library lecturer;

import 'package:built_value/built_value.dart';

part 'lecturer.g.dart';

abstract class Lecturer implements Built<Lecturer, LecturerBuilder> {
  // fields go here
  String get uid;
  String get name;
  String get email;
  String get phone;
  String get image;
  String get facultyId;

  Lecturer._();

  factory Lecturer([updates(LecturerBuilder b)]) = _$Lecturer;
}
