import '../models/news.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../models/faculty.dart';
import '../models/lecturer.dart';
import '../models/question.dart';

class ConnectToDataSource {
  @override
  String toString() {
    return "ConnectToDataSource{}";
  }
}

class OnFacultiesLoaded {
  final List<Faculty> faculties;

  const OnFacultiesLoaded(this.faculties);

  @override
  String toString() {
    return "OnFacultiesLoaded{faculties: $faculties}";
  }
}

class OnLecturersLoaded {
  final List<Lecturer> lecturers;

  const OnLecturersLoaded(this.lecturers);

  @override
  String toString() {
    return "OnLecturersLoaded{lecturers: $lecturers}";
  }
}

class OnNewsLoaded {
  final List<News> news;

  const OnNewsLoaded(this.news);

  @override
  String toString() {
    return "OnNewsLoaded{news: $news}";
  }
}

class OnReviewsLoaded {
  final List<Review> reviews;

  const OnReviewsLoaded(this.reviews);
}

class OnUsersLoaded {
  final List<User> users;

  const OnUsersLoaded(this.users);
}

class OnQuestionsLoaded {
  final List<Question> questions;

  OnQuestionsLoaded(this.questions);
}
