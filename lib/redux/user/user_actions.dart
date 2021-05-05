import 'dart:async';

import 'package:flutter/widgets.dart';
import '../../models/user.dart';

@immutable
class OnUserUpdateAction {
  final User user;

  const OnUserUpdateAction(this.user);
}

class OnUploadImage {
  final String filePath;
  final Completer completer;

  OnUploadImage({this.filePath, Completer completer})
      : completer = completer ?? Completer();
}

class OnUploadedImage {
  final User user;

  OnUploadedImage(this.user);
}

@immutable
class UpdateUserLocaleAction {
  final String locale;

  const UpdateUserLocaleAction(this.locale);
}

@immutable
class UpdateUserAction {
  final User user;
  final Completer completer;

  UpdateUserAction({this.user, Completer completer})
      : completer = completer ?? Completer();
}

class FetchUsers {}

class ChangePassword {
  final String newPassword;
  final Completer completer;

  ChangePassword({this.newPassword, Completer completer})
      : completer = completer ?? Completer();
}

class ResetPassword {
  final String email;
  final Completer completer;

  ResetPassword({this.email, Completer completer})
      : completer = completer ?? Completer();
}
