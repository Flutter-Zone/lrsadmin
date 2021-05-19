library main_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/models/faculty.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/models/news.dart';
import 'package:lrsadmin/models/review.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'main_view_model.g.dart';

abstract class MainViewModel
    implements Built<MainViewModel, MainViewModelBuilder> {
  // fields go here
  BuiltList<Lecturer> get lecturers;
  BuiltList<Course> get courses;
  BuiltList<Faculty> get faculties;
  BuiltList<User> get students;
  BuiltList<News> get news;
  BuiltList<Review> get reviews;

  MainViewModel._();

  factory MainViewModel([updates(MainViewModelBuilder b)]) = _$MainViewModel;

  static MainViewModel fromStore(Store<AppState> store) {
    return MainViewModel((m) => m
      ..lecturers = ListBuilder(store.state.lecturers)
      ..faculties = ListBuilder(store.state.faculties)
      ..courses = ListBuilder(store.state.courses)
      ..students = ListBuilder(store.state.users)
      ..news = ListBuilder(store.state.news)
      ..reviews = ListBuilder(store.state.reviews));
  }
}
