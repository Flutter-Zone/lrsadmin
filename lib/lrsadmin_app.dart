import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './data/comment_repository.dart';
import './data/news_repository.dart';
import './data/review_repository.dart';
import './redux/comment/comment_middleware.dart';
import './redux/news/news_middleware.dart';
import './redux/review/review_middleware.dart';
import './constants/colors.dart';
import './data/faculty_repository.dart';
import './redux/app_middleware.dart';
import './routes.dart';
import './redux/app_state.dart';
import './data/user_repository.dart';
import './data/lecturer_repository.dart';
import './redux/auth/auth_actions.dart';
import './redux/app_reducer.dart';
import './redux/user/user_middlewares.dart';
import './redux/auth/auth_middleware.dart';
import './redux/lecturer/lecturer_middleware.dart';
import './data/file_repository.dart';
import './redux/attachment/attachment_middlewares.dart';
import './redux/attachment/image_processor.dart';

import './data/lecturer_course_repository.dart';
import './data/course_repository.dart';
import './data/question_repository.dart';
import './presentation/main_screen.dart';

class LecturersEvaluatorAdminApp extends StatefulWidget {
  @override
  LecturersEvaluatorAdminAppState createState() =>
      LecturersEvaluatorAdminAppState();
}

class LecturersEvaluatorAdminAppState
    extends State<LecturersEvaluatorAdminApp> {
  Store<AppState> store;
  static final _navigatorKey = GlobalKey<NavigatorState>();

  final userRepository =
      UserRepository(FirebaseAuth.instance, FirebaseFirestore.instance);
  final facultyRepository = FacultyRepository(FirebaseFirestore.instance);
  final lecturerRepository = LecturerRepository(FirebaseFirestore.instance);
  final lecturerCourseRepository =
      LecturerCourseRepository(FirebaseFirestore.instance);
  final courseRepository = CourseRepository(FirebaseFirestore.instance);
  final reviewRepository = ReviewRepository(FirebaseFirestore.instance);
  final newsRepository = NewsRepository(FirebaseFirestore.instance);
  final commentRepository = CommentRepository(FirebaseFirestore.instance);
  final questionRepository = QuestionRepository(FirebaseFirestore.instance);

  @override
  void initState() {
    super.initState();
    store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: createStoreMiddleware(
        facultyRepository,
        lecturerRepository,
        newsRepository,
        reviewRepository,
        userRepository,
        questionRepository,
      )
        ..addAll(
          createAttachmentMiddleware(
            FileRepository(FirebaseStorage.instance),
            ImageProcessor(),
            userRepository,
          ),
        )
        ..addAll(
          createUserMiddleware(
            userRepository,
          ),
        )
        ..addAll(
          createAuthenticationMiddleware(
            userRepository,
            _navigatorKey,
          ),
        )
        ..addAll(
          createLecturerMiddleware(lecturerCourseRepository, courseRepository),
        )
        ..addAll(
          createReviewMiddleware(reviewRepository),
        )
        ..addAll(
          createCommentMiddleware(commentRepository),
        )
        ..addAll(createNewsMiddleware(newsRepository)),
    );

    store.dispatch(VerifyAuthenticationState());
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LRS Admin',
        navigatorKey: _navigatorKey,
        theme: ThemeData(
          primaryColor: colorPrimary,
          fontFamily: "Jost",
        ),
        routes: {
          Routes.home: (context) => MainScreen(),
        },
      ),
    );
  }
}
