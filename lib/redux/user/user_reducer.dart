import 'package:redux/redux.dart';
import '../../redux/user/user_actions.dart';

import '../app_state.dart';

final userReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnUserUpdateAction>(_onUserUpdate)
];

AppState _onUserUpdate(AppState state, OnUserUpdateAction action) {
  return state.rebuild((a) => a..user = action.user.toBuilder());
}
