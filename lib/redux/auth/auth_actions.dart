import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../models/user.dart';

// Authentication
class VerifyAuthenticationState {}

class SignInWithGoogle {
  final Completer completer;

  SignInWithGoogle({Completer completer})
      : completer = completer ?? Completer();
}

class SignInWithFacebook {
  final Completer completer;

  SignInWithFacebook({Completer completer})
      : completer = completer ?? Completer();
}

class SignInWithTwitter {
  final Completer completer;

  SignInWithTwitter({Completer completer})
      : completer = completer ?? Completer();
}

class LogIn {
  final String email;
  final String password;
  final Completer completer;

  LogIn({this.email, this.password, Completer completer})
      : completer = completer ?? Completer();
}

class SignUp {
  final String email;
  final String password;
  final String name;
  final String phone;
  final Completer completer;

  SignUp(
      {this.email, this.password, this.name, this.phone, Completer completer})
      : completer = completer ?? Completer();
}

@immutable
class OnAuthenticated {
  final User user;

  const OnAuthenticated({@required this.user});

  @override
  String toString() {
    return "OnAuthenticated{user: $user}";
  }
}

@immutable
class OnUpdateUserProfile {
  final User user;

  const OnUpdateUserProfile({@required this.user});

  @override
  String toString() {
    return "OnAuthenticated{user: $user}";
  }
}

class LogOutAction {}

class OnLogoutSuccess {
  OnLogoutSuccess();

  @override
  String toString() {
    return "LogOut{user: null}";
  }
}

class OnLogoutFail {
  final dynamic error;

  OnLogoutFail(this.error);

  @override
  String toString() {
    return "OnLogoutFail{There was an error logging in: $error}";
  }
}

class SetUserLocation {
  final GeoPoint geoPoint;
  final String locationAddress;

  SetUserLocation(this.geoPoint, this.locationAddress);

  @override
  String toString() {
    return "SetUserLocation{There was an error setting user geopoint: $geoPoint}";
  }
}

class OnUserLocationSet {
  final User user;
  OnUserLocationSet(this.user);

  @override
  String toString() {
    return "OnUserLocationSet{There was an error updating user: $user}";
  }
}
