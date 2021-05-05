import 'package:firebase_core/firebase_core.dart';
import 'package:redux/redux.dart';
import '../../data/user_repository.dart';
import '../../redux/user/user_actions.dart';
import '../../redux/auth/auth_actions.dart';

import '../app_state.dart';
import '../stream_subscriptions.dart';

List<Middleware<AppState>> createUserMiddleware(
  UserRepository userRepository,
) {
  return [
    TypedMiddleware<AppState, OnAuthenticated>(_listenToUser(userRepository)),
    TypedMiddleware<AppState, UpdateUserAction>(_updateUser(userRepository)),
    TypedMiddleware<AppState, ChangePassword>(_changePasword(userRepository)),
    TypedMiddleware<AppState, ResetPassword>(_resetPassword(userRepository)),
  ];
}

void Function(
  Store<AppState> store,
  OnAuthenticated action,
  NextDispatcher next,
) _listenToUser(
  UserRepository userRepository,
) {
  return (store, action, next) {
    next(action);
    try {
      userSubscription?.cancel();
      userSubscription =
          userRepository.getUserStream(action.user.uid).listen((user) {
        store.dispatch(OnUserUpdateAction(user));
      });
    } catch (e) {
      print("Failed to listen user");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateUserAction action,
  NextDispatcher next,
) _updateUser(
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid != action.user.uid) {
      action.completer
          .completeError(Exception("You can't update other users!"));
      return;
    }
    try {
      await userRepository.updateUser(action.user);
      store.dispatch(OnUserUpdateAction(action.user));
      action.completer.complete("Profile updated successfully.");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update profile");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update profile");
    }
  };
}

void Function(
  Store<AppState> store,
  ChangePassword action,
  NextDispatcher next,
) _changePasword(
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.changePassword(action.newPassword);
      action.completer.complete("Password changed successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to change password");
    } catch (error) {
      action.completer.completeError("Oops! Failed to change password");
    }
  };
}

void Function(
  Store<AppState> store,
  ResetPassword action,
  NextDispatcher next,
) _resetPassword(
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.resetPassword(action.email);
      action.completer.complete("reset email sent");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to send reset link");
    } catch (error) {
      action.completer.completeError("Oops! Failed to send reset link");
    }
  };
}
