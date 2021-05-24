import "dart:async";
import 'package:lrsadmin/models/comment.dart';

import '../models/faculty.dart';
import '../models/news.dart';
import '../models/review.dart';
import "../models/user.dart";
import "../models/course.dart";
import "../models/lecturer.dart";
import '../models/lecturer_course.dart';
import '../models/question.dart';

StreamSubscription<User> userSubscription;
StreamSubscription<List<Faculty>> facultiesSubscription;
StreamSubscription<List<Lecturer>> lecturersSubscription;
StreamSubscription<List<LecturerCourse>> lecturerCoursesSubscription;
StreamSubscription<List<Review>> reviewsSubscription;
StreamSubscription<Course> courseSubscription;
StreamSubscription<List<User>> usersSubscription;
StreamSubscription<List<News>> newsSubscription;
StreamSubscription<List<Comment>> commentsSubscription;
StreamSubscription<List<Question>> questionsSubscription;
StreamSubscription<List<Course>> coursesSubscription;

cancelAllSubscriptions() {
  userSubscription?.cancel();
  facultiesSubscription?.cancel();
  lecturersSubscription?.cancel();
  lecturerCoursesSubscription?.cancel();
  reviewsSubscription?.cancel();
  courseSubscription?.cancel();
  usersSubscription?.cancel();
  newsSubscription?.cancel();
  commentsSubscription?.cancel();
  questionsSubscription?.cancel();
  coursesSubscription?.cancel();
}
