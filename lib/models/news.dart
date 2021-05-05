library news;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'news.g.dart';

abstract class News implements Built<News, NewsBuilder> {
  // fields go here
  String get uid;
  String get title;
  String get subtitle;
  String get description;
  String get image;
  BuiltList get users;
  Timestamp get createdAt;

  News._();

  factory News([updates(NewsBuilder b)]) = _$News;
}
