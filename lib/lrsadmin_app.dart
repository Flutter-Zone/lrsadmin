import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lrsadmin/presentation/assign_course_to_lecturer_screen.dart';
import 'package:lrsadmin/presentation/common/generate_report_page.dart';
import 'package:lrsadmin/presentation/password/forgot_password_screen.dart';
import 'package:lrsadmin/presentation/password/password_reset_email_screen.dart';
import 'package:lrsadmin/presentation/question/add_question_screen.dart';
import 'package:lrsadmin/presentation/question/questions_screen.dart';
import 'package:redux/redux.dart';

import './presentation/auth/login_screen.dart';
import './presentation/comments/comments_screen.dart';
import './presentation/courses/add_course_screen.dart';
import './presentation/faculties/add_faculty_screen.dart';
import './presentation/faculties/faculties_screen.dart';
import './presentation/lecturers/add_lecturer_screen.dart';
import './presentation/lecturers/lecturers_screen.dart';
import './presentation/news/add_news_screen.dart';
import './presentation/news/news_screen.dart';
import './presentation/reviews/reviews_screen.dart';
import './presentation/student/add_student_screen.dart';
import './presentation/student/students_screen.dart';
import './redux/course/course_middlewares.dart';
import './redux/faculty/faculty_middleware.dart';
import './redux/question/question_middlewares.dart';
import './redux/student/student_middleware.dart';
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
import './presentation/courses/courses_screen.dart';

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
  final fileRepository = FileRepository(FirebaseStorage.instance);
  final imageProcessor = ImageProcessor();

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
        courseRepository,
        commentRepository,
        lecturerCourseRepository,
      )
        ..addAll(
          createAttachmentMiddleware(
            fileRepository,
            imageProcessor,
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
          createLecturerMiddleware(
            lecturerCourseRepository,
            courseRepository,
            lecturerRepository,
            fileRepository,
            imageProcessor,
          ),
        )
        ..addAll(
          createReviewMiddleware(reviewRepository),
        )
        ..addAll(
          createCommentMiddleware(commentRepository),
        )
        ..addAll(
          createNewsMiddleware(newsRepository, fileRepository, imageProcessor),
        )
        ..addAll(
          createCourseMiddleware(
            courseRepository,
            lecturerCourseRepository,
          ),
        )
        ..addAll(
          createFacultyMiddleware(
            facultyRepository,
            fileRepository,
            imageProcessor,
          ),
        )
        ..addAll(
          createStudentMiddleware(
            userRepository,
            fileRepository,
            imageProcessor,
          ),
        )
        ..addAll(
          createQuestionMiddleware(
            questionRepository,
          ),
        ),
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
          Routes.lecturers: (context) => LecturersScreen(),
          Routes.login: (context) => LoginScreen(),
          Routes.addLecturer: (context) => AddLecturerScreen(),
          Routes.courses: (context) => CoursesScreen(),
          Routes.addCourse: (context) => AddCourseScreen(),
          Routes.faculties: (context) => FacultiesScreen(),
          Routes.addFaculty: (context) => AddFacultyScreen(),
          Routes.students: (context) => StudentsScreen(),
          Routes.addStudent: (context) => AddStudentScreen(),
          Routes.news: (context) => NewsScreen(),
          Routes.addNews: (context) => AddNewsScreen(),
          Routes.reviews: (context) => ReviewsScreen(),
          Routes.comments: (context) => CommentsScreen(),
          Routes.questions: (context) => QuestionsScreen(),
          Routes.addQuestion: (context) => AddQuestionScreen(),
          Routes.generateReport: (context) => GenerateReportPage(),
          Routes.forgotPassword: (context) => ForgotPasswordScreen(),
          Routes.passwordResetEmail: (context) => PasswordResetEmailScreen(),
          Routes.assignCourseToLecturer: (context) =>
              AssignCoursesToLecturerScreen()
        },
      ),
    );
  }
}
