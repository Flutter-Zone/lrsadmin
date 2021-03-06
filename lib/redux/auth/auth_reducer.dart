import 'package:redux/redux.dart';

import '../app_state.dart';
import 'auth_actions.dart';

final authReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnAuthenticated>(_onAuthenticated),
  TypedReducer<AppState, OnUserLocationSet>(_onUserLocationSet),
  TypedReducer<AppState, OnLogoutSuccess>(_onLogout),
];

AppState _onAuthenticated(AppState state, OnAuthenticated action) {
  return state.rebuild((a) => a..user = action.user.toBuilder());
}

AppState _onUserLocationSet(AppState state, OnUserLocationSet action) {
  return state.rebuild((a) => a..user = action.user.toBuilder());
}

AppState _onLogout(AppState state, OnLogoutSuccess action) {
  return state.clear();
}
