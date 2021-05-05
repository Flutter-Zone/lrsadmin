library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import '../models/comment.dart';
import '../models/news.dart';
import '../models/review.dart';
import '../models/faculty.dart';
import '../models/user.dart';
import '../models/lecturer.dart';
import '../models/lecturer_course.dart';
import '../models/course.dart';
import '../models/question.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  // fields go here
  @nullable
  User get user;

  BuiltList<Faculty> get faculties;

  BuiltList<Lecturer> get lecturers;

  BuiltList<LecturerCourse> get lecturerCourses;

  BuiltList<Course> get courses;

  BuiltList<Review> get reviews;

  BuiltList<User> get users;

  BuiltList<News> get news;

  BuiltList<Comment> get comments;

  BuiltList<Question> get questions;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.init() => AppState(
        (a) => a
          ..faculties = ListBuilder()
          ..lecturers = ListBuilder()
          ..lecturerCourses = ListBuilder()
          ..courses = ListBuilder()
          ..reviews = ListBuilder()
          ..comments = ListBuilder()
          ..questions = ListBuilder()
          ..news = ListBuilder(),
      );

  AppState clear() {
    return AppState.init().rebuild((s) => s = AppStateBuilder());
  }
}
