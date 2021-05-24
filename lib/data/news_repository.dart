import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news.dart';

import 'firebase_paths.dart';

class NewsRepository {
  static const UID = "uid";
  static const TITLE = "title";
  static const SUBTITLE = "subtitle";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";
  static const USERS = "users";
  static const CREATED_AT = "createdAt";

  final FirebaseFirestore _firebaseFirestore;

  const NewsRepository(this._firebaseFirestore);

  Stream<News> getNewStream(newsId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_NEWS)
        .doc(newsId)
        .snapshots()
        .map((newsSnapshot) => fromDoc(newsSnapshot));
  }

  Stream<List<News>> getNewsStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_NEWS)
        .snapshots()
        .map((newsSnapshot) {
      final news = newsSnapshot.docs.map(fromDoc).toList();
      news.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return news;
    });
  }

  Future<void> updateUserList(String newsId, List<String> userList) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.newsPath(newsId));
    return documentReference.update({
      USERS: userList,
    });
  }

  Future<void> addNews(title, subtitle, description, image) async {
    CollectionReference news =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_NEWS);
    return news.add({
      TITLE: title,
      SUBTITLE: subtitle,
      DESCRIPTION: description,
      IMAGE: image,
      USERS: [],
    });
  }

  Future<void> updateNews(title, subtitle, description, image, newsId) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.newsPath(newsId));
    return documentReference.update({
      TITLE: title,
      SUBTITLE: subtitle,
      DESCRIPTION: description,
      IMAGE: image,
    });
  }

  Future<void> deleteNews(newsId) {
    CollectionReference news =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_NEWS);

    return news.doc(newsId).delete();
  }

  static News fromDoc(DocumentSnapshot document) {
    return News(
      (r) => r
        ..uid = document.id
        ..title = document[TITLE]
        ..subtitle = document[SUBTITLE]
        ..description = document[DESCRIPTION]
        ..image = document[IMAGE]
        ..users = ListBuilder<String>(document[USERS])
        ..createdAt = document[CREATED_AT],
    );
  }
}
