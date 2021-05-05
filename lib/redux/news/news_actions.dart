import 'dart:async';

class UpdateNewsUsers {
  final String newsId;
  List<String> users;
  final Completer completer;

  UpdateNewsUsers({this.newsId, this.users, Completer completer})
      : completer = completer ?? Completer();
}
