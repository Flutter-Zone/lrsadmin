library faculty;

import 'package:built_value/built_value.dart';

part 'faculty.g.dart';

abstract class Faculty implements Built<Faculty, FacultyBuilder> {
  // fields go here
  String get uid;
  String get name;
  String get description;
  String get image;

  Faculty._();

  factory Faculty([updates(FacultyBuilder b)]) = _$Faculty;
}
