class FirestorePaths {
  static const PATH_USERS = "users";
  static const PATH_FACULTIES = "faculties";
  static const PATH_LECTURERS = "lecturers";
  static const PATH_COURSES = "courses";
  static const PATH_LECTURER_COURSES = "lecturer_courses";
  static const PATH_REVIEWS = "reviews";
  static const PATH_NEWS = "news";
  static const PATH_COMMENT = "comments";
  static const PATH_QUESTIONS = "questions";

  static String userPath(String userId) {
    return "$PATH_USERS/$userId";
  }

  static String reviewPath(String reviewId) {
    return "$PATH_REVIEWS/$reviewId";
  }

  static String commentPath(String commentId) {
    return "$PATH_COMMENT/$commentId";
  }

  static String newsPath(String newsId) {
    return "$PATH_NEWS/$newsId";
  }

  static String lecturerPath(String lecturerId) {
    return "$PATH_LECTURERS/$lecturerId";
  }

  static String coursePath(String courseId) {
    return "$PATH_COURSES/$courseId";
  }

  static String facultyPath(String facultyId) {
    return "$PATH_FACULTIES/$facultyId";
  }
}
