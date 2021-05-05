import 'package:built_collection/built_collection.dart';
import '../../redux/comment/comment_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

final commentReducer = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnNewsCommentLoaded>(_onNewsLoaded)
];

AppState _onNewsLoaded(AppState state, OnNewsCommentLoaded action) {
  return state.rebuild((a) => a..comments = ListBuilder(action.comments));
}
