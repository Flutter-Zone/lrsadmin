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

Question getQuestion(List<Question> questions, String questionId) {
  return questions.firstWhere((question) => question.uid == questionId,
      orElse: () => null);
}

bool isAlreadyCommented(List<Review> reviews, String courseId, String userId) {
  print("checking values: $reviews, $courseId , $userId");
  final result = reviews.firstWhere(
      (review) => review.courseId == courseId && review.userId == userId,
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
