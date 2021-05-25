import 'package:lrsadmin/models/comment.dart';
import 'package:lrsadmin/models/lecturer_course.dart';

import '../models/course.dart';
import '../models/faculty.dart';
import '../models/lecturer.dart';
import '../models/news.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../models/question.dart';

User getUser(List<User> users, String userId) {
  return users.firstWhere((user) => user.uid == userId, orElse: () => null);
}

Course getCourse(List<Course> courses, String courseId) {
  return courses.firstWhere((course) => course.uid == courseId,
      orElse: () => null);
}

News getNews(List<News> newss, String newsId) {
  return newss.firstWhere((news) => news.uid == newsId, orElse: () => null);
}

Question getQuestion(List<Question> questions, String questionId) {
  return questions.firstWhere((question) => question.uid == questionId,
      orElse: () => null);
}

bool isAlreadyCommented(List<Review> reviews, String courseId, String userId) {
  final result = reviews.firstWhere(
      (review) => review.courseId == courseId && review.userId == userId,
      orElse: () => null);
  if (result == null) {
    return false;
  }
  return true;
}

bool isAlreadyAssigned(
    List<LecturerCourse> lecturerCourses, String courseId, String lecturerId) {
  final result = lecturerCourses.firstWhere(
      (lecturerCourse) =>
          lecturerCourse.courseId == courseId &&
          lecturerCourse.lecturerId == lecturerId,
      orElse: () => null);
  if (result == null) {
    return false;
  }
  return true;
}

Faculty getFaculty(List<Faculty> faculties, String facultyId) {
  return faculties.firstWhere((faculty) => faculty.uid == facultyId,
      orElse: () => null);
}

List<Review> filterReviews(
    List<Review> reviews, String theStartDate, String theEndDate) {
  DateTime startDate = DateTime.parse(theStartDate);
  DateTime endDate = DateTime.parse(theEndDate);
  List<Review> filteredReviews = [];

  reviews.forEach((Review review) {
    if ((review.createdAt.toDate().isAfter(startDate) &&
            review.createdAt.toDate().isBefore(endDate)) ||
        review.createdAt.toDate().isAtSameMomentAs(startDate) ||
        review.createdAt.toDate().isAtSameMomentAs(endDate)) {
      filteredReviews.add(review);
    }
  });
  return filteredReviews;
}

List<Review> getStudentReviews(List<Review> reviews, String theStartDate,
    String theEndDate, String studentId) {
  List<Review> filteredReviews =
      filterReviews(reviews, theStartDate, theEndDate);
  return filteredReviews
      .where((Review review) => review.userId == studentId)
      .toList();
}

List<Review> getLecturerReviews(List<Review> reviews, String theStartDate,
    String theEndDate, String lecturerId) {
  List<Review> filteredReviews =
      filterReviews(reviews, theStartDate, theEndDate);
  return filteredReviews
      .where((Review review) => review.lecturerId == lecturerId)
      .toList();
}

List<Comment> getStudentComments(List<Comment> comments, String theStartDate,
    String theEndDate, String studentId) {
  List<Comment> filteredComments =
      filterComments(comments, theStartDate, theEndDate);
  return filteredComments
      .where((Comment comment) => comment.userId == studentId)
      .toList();
}

List<Comment> filterComments(
    List<Comment> comments, String theStartDate, String theEndDate) {
  DateTime startDate = DateTime.parse(theStartDate);
  DateTime endDate = DateTime.parse(theEndDate);
  List<Comment> filteredComments = [];

  comments.forEach((Comment comment) {
    if ((comment.createdAt.toDate().isAfter(startDate) &&
            comment.createdAt.toDate().isBefore(endDate)) ||
        comment.createdAt.toDate().isAtSameMomentAs(startDate) ||
        comment.createdAt.toDate().isAtSameMomentAs(endDate)) {
      filteredComments.add(comment);
    }
  });
  return filteredComments;
}

List<Lecturer> filterLecturer(List<Lecturer> lecturers, String facultyId) {
  return lecturers
      .where((lecturer) => lecturer.facultyId == facultyId)
      .toList();
}

List<News> filterNews(List<News> newss, String userId) {
  return newss.where((news) => news.users.contains(userId)).toList();
}

Lecturer getLecturer(List<Lecturer> lecturers, lecturerId) {
  return lecturers.firstWhere((lecturer) => lecturer.uid == lecturerId,
      orElse: () => null);
}

double getAverageRating(List<Review> reviews, String lecturerId) {
  double totalReview = 0.0;
  final filteredReviews =
      reviews.where((Review review) => review.lecturerId == lecturerId);
  filteredReviews.forEach((review) => totalReview += review.rating);

  return totalReview / filteredReviews.length;
}
