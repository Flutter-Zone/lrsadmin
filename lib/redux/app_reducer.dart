import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

import '../redux/comment/comment_reducers.dart';
import '../redux/app_action.dart';
import '../redux/app_state.dart';
import '../redux/auth/auth_reducer.dart';
import '../redux/user/user_reducer.dart';
import '../redux/lecturer/lecturer_reducer.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, OnFacultiesLoaded>(_onFacultiesLoaded),
  TypedReducer<AppState, OnLecturersLoaded>(_onLecturersLoaded),
  TypedReducer<AppState, OnNewsLoaded>(_onNewsLoaded),
  TypedReducer<AppState, OnReviewsLoaded>(_onReviewsLoaded),
  TypedReducer<AppState, OnUsersLoaded>(_onUsersLoaded),
  TypedReducer<AppState, OnQuestionsLoaded>(_onQuestionsLoaded),
  TypedReducer<AppState, OnCoursesLoaded>(_onCoursesLoaded),
  ...lecturerReducers,
  ...authReducers,
  ...userReducers,
  ...commentReducer,
]);

AppState _onFacultiesLoaded(AppState state, OnFacultiesLoaded action) {
  if (action.faculties.isEmpty) {
    return state.rebuild((a) => a..faculties = ListBuilder([]));
  }
  return state.rebuild((a) => a..faculties = ListBuilder(action.faculties));
}

AppState _onLecturersLoaded(AppState state, OnLecturersLoaded action) {
  if (action.lecturers.isEmpty) {
    return state.rebuild((a) => a..lecturers = ListBuilder([]));
  }
  return state.rebuild((a) => a..lecturers = ListBuilder(action.lecturers));
}

AppState _onNewsLoaded(AppState state, OnNewsLoaded action) {
  if (action.news.isEmpty) {
    return state.rebuild((a) => a..news = ListBuilder([]));
  }
  return state.rebuild((a) => a..news = ListBuilder(action.news));
}

AppState _onReviewsLoaded(AppState state, OnReviewsLoaded action) {
  if (action.reviews.isEmpty) {
    return state.rebuild((a) => a..reviews = ListBuilder([]));
  }
  return state.rebuild((a) => a..reviews = ListBuilder(action.reviews));
}

AppState _onUsersLoaded(AppState state, OnUsersLoaded action) {
  if (action.users.isEmpty) {
    return state.rebuild((a) => a..users = ListBuilder([]));
  }
  return state.rebuild((a) => a..users = ListBuilder(action.users));
}

AppState _onQuestionsLoaded(AppState state, OnQuestionsLoaded action) {
  if (action.questions.isEmpty) {
    return state.rebuild((a) => a..questions = ListBuilder([]));
  }
  return state.rebuild((a) => a..questions = ListBuilder(action.questions));
}

AppState _onCoursesLoaded(AppState state, OnCoursesLoaded action) {
  if (action.courses.isEmpty) {
    return state.rebuild((a) => a..courses = ListBuilder([]));
  }
  return state.rebuild((a) => a..courses = ListBuilder(action.courses));
}
