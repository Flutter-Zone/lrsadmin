import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../errors/firebase_auth_errors.dart';
import 'package:redux/redux.dart';
import 'auth_actions.dart';
import '../../data/user_repository.dart';
import '../../redux/app_state.dart';
import '../../routes.dart';
import '../app_action.dart';
import '../stream_subscriptions.dart';

List<Middleware<AppState>> createAuthenticationMiddleware(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [
    TypedMiddleware<AppState, VerifyAuthenticationState>(
        _verifyAuthState(userRepository, navigatorKey)),
    TypedMiddleware<AppState, LogIn>(_authLogin(userRepository, navigatorKey)),
    TypedMiddleware<AppState, LogOutAction>(
        _authLogout(userRepository, navigatorKey)),
  ];
}

void Function(
  Store<AppState> store,
  VerifyAuthenticationState action,
  NextDispatcher next,
) _verifyAuthState(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) {
    next(action);

    userRepository.getAuthenticationStateChange().listen(
      (user) {
        if (user == null) {
          navigatorKey.currentState.popUntil((route) => route.isFirst);
          navigatorKey.currentState.pushReplacementNamed(Routes.login);
        } else {
          store.dispatch(OnAuthenticated(user: user));
          store.dispatch(ConnectToDataSource());
        }
      },
    );
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogout(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.logOut();
      cancelAllSubscriptions();
      store.dispatch(OnLogoutSuccess());
    } catch (e) {
      store.dispatch(OnLogoutFail(e));
    }
  };
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogin(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      final dataMap =
          await userRepository.signIn(action.email, action.password);
      if (dataMap["isVerified"]) {
        store.dispatch(OnAuthenticated(user: dataMap["user"]));
        navigatorKey.currentState.popUntil((route) => route.isFirst);
        navigatorKey.currentState.pushReplacementNamed(Routes.home);
        action.completer.complete();
      } else {
        final errorMap = {
          "title": "Email not verified",
          "message":
              "This email has not been verified. If you signed up with this email, kindly check your inbox or spam folder for the email and click on the link to."
        };
        action.completer.completeError(errorMap);
      }
    } on FirebaseAuthException catch (error) {
      final errorMap = getFirebaseErrorMessage(error.code.toString());
      action.completer.completeError(errorMap);
    } catch (error) {
      final errorMap = {
        "title": "Something happened!",
        "message":
            "We think something terrible happened. Please try again later"
      };
      action.completer.completeError(errorMap);
    }
  };
}
