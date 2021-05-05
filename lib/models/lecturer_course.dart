library lecturer_course;

import 'package:built_value/built_value.dart';

part 'lecturer_course.g.dart';

abstract class LecturerCourse
    implements Built<LecturerCourse, LecturerCourseBuilder> {
  // fields go here
  //
  String get uid;
  String get courseId;
  String get lecturerId;
  String get day;
  String get time;

  LecturerCourse._();

  factory LecturerCourse([updates(LecturerCourseBuilder b)]) = _$LecturerCourse;
}
