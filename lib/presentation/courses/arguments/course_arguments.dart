import 'package:lrsadmin/models/review.dart';

class CourseArgument {
  final String courseId;
  final String lecturerId;
  final String lecturerCourseId;
  final Review review;
  final bool isAdding;
  CourseArgument({
    this.courseId,
    this.lecturerId,
    this.lecturerCourseId,
    this.review,
    this.isAdding,
  });
}
