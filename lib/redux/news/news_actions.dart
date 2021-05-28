import 'dart:async';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateNewsUsers {
  final String newsId;
  List<String> users;
  final Completer completer;

  UpdateNewsUsers({this.newsId, this.users, Completer completer})
      : completer = completer ?? Completer();
}

class AddNews {
  final File file;
  final String title;
  final String subtitle;
  final String description;
  final Timestamp createdAt;
  final Completer completer;

  AddNews({
    this.file,
    this.title,
    this.subtitle,
    this.description,
    this.createdAt,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateNews {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final File file;
  final String newsId;
  final Completer completer;

  UpdateNews({
    this.title,
    this.subtitle,
    this.description,
    this.image,
    this.file,
    this.newsId,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class DeleteNews {
  final String newsId;
  final Completer completer;

  DeleteNews({this.newsId, Completer completer})
      : completer = completer ?? Completer();
}
