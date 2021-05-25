library generate_report_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/comment.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/models/news.dart';
import 'package:lrsadmin/models/question.dart';
import 'package:lrsadmin/models/review.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'generate_report_view_model.g.dart';

abstract class GenerateReportViewModel
    implements Built<GenerateReportViewModel, GenerateReportViewModelBuilder> {
  // fields go here
  BuiltList<User> get students;
  BuiltList<Lecturer> get lecturers;
  BuiltList<Review> get reviews;
  BuiltList<Question> get questions;
  BuiltList<Course> get courses;
  BuiltList<Comment> get comments;
  BuiltList<News> get news;
  BuiltList<User> get users;

  GenerateReportViewModel._();

  factory GenerateReportViewModel([updates(GenerateReportViewModelBuilder b)]) =
      _$GenerateReportViewModel;

  static GenerateReportViewModel fromStore(Store<AppState> store) {
    return GenerateReportViewModel((g) => g
      ..students = ListBuilder(store.state.users)
      ..lecturers = ListBuilder(store.state.lecturers)
      ..reviews = ListBuilder(store.state.reviews)
      ..questions = ListBuilder(store.state.questions)
      ..courses = ListBuilder(store.state.courses)
      ..comments = ListBuilder(store.state.comments)
      ..news = ListBuilder(store.state.news)
      ..users = ListBuilder(store.state.users));
  }
}
