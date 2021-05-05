import 'package:redux/redux.dart';

import '../data/news_repository.dart';
import '../data/review_repository.dart';
import '../data/user_repository.dart';
import '../data/question_repository.dart';
import '../models/news.dart';
import '../models/review.dart';
import '../models/user.dart';
import '../data/faculty_repository.dart';
import '../data/lecturer_repository.dart';
import '../models/faculty.dart';
import '../models/lecturer.dart';
import '../models/question.dart';
import '../redux/app_action.dart';
import '../redux/stream_subscriptions.dart';

import 'app_state.dart';

List<Middleware<AppState>> createStoreMiddleware(
  FacultyRepository facultyRepository,
  LecturerRepository lecturerRepository,
  NewsRepository newsRepository,
  ReviewRepository reviewRepository,
  UserRepository userRepository,
  QuestionRepository questionRepository,
) {
  return [
    TypedMiddleware<AppState, ConnectToDataSource>(
      _loadData(
        facultyRepository,
        lecturerRepository,
        newsRepository,
        reviewRepository,
        userRepository,
        questionRepository,
      ),
    ),
  ];
}

void Function(
  Store<AppState> store,
  ConnectToDataSource action,
  NextDispatcher next,
) _loadData(
  FacultyRepository facultyRepository,
  LecturerRepository lecturerRepository,
  NewsRepository newsRepository,
  ReviewRepository reviewRepository,
  UserRepository userRepository,
  QuestionRepository questionRepository,
) {
  return (store, action, next) async {
    next(action);

    try {
      // fetch all users and listen to the stream for changes, assign stream to userssubscription
      usersSubscription?.cancel();
      usersSubscription =
          userRepository.getUsersStream().listen((List<User> users) {
        store.dispatch(OnUsersLoaded(users));
      });

      // fetch all faculties and listen to the stream for changes, assign stream to facultiesSubscription
      facultiesSubscription?.cancel();
      facultiesSubscription = facultyRepository
          .getFacultiesStream()
          .listen((List<Faculty> faculties) {
        store.dispatch(OnFacultiesLoaded(faculties));
      });

      // fetch all lecturers and list to the stream for changes, assign stream to lecturersSubscription
      lecturersSubscription?.cancel();
      lecturersSubscription = lecturerRepository
          .getLecturersStream()
          .listen((List<Lecturer> lecturers) {
        store.dispatch(OnLecturersLoaded(lecturers));
      });

      // fetch all news and list to the stream for changes, assign stream to newssubscription
      newsSubscription?.cancel();
      newsSubscription =
          newsRepository.getNewsStream().listen((List<News> news) {
        store.dispatch(OnNewsLoaded(news));
      });

      // fetch all reviews and list to the stream for changes, assign stream to reviewssubscription
      reviewsSubscription?.cancel();
      reviewsSubscription =
          reviewRepository.getReviewsStream().listen((List<Review> reviews) {
        store.dispatch(OnReviewsLoaded(reviews));
      });

      questionsSubscription?.cancel();
      questionsSubscription = questionRepository
          .getQuestionsStream()
          .listen((List<Question> questions) {
        store.dispatch(OnQuestionsLoaded(questions));
      });
    } catch (e) {
      print("Something terrible just happened: $e");
    }
  };
}