library course;

import 'package:built_value/built_value.dart';

part 'course.g.dart';

abstract class Course implements Built<Course, CourseBuilder> {
  // fields go here
  String get uid;
  String get title;
  String get description;
  double get creditHours;

  Course._();

  factory Course([updates(CourseBuilder b)]) = _$Course;
}
