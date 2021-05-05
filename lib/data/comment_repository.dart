import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/comment.dart';
import 'firebase_paths.dart';

class CommentRepository {
  static const USER_ID = "user_id";
  static const NEWS_ID = "news_id";
  static const COMMENT = "comment";
  static const CREATED_AT = "createdAt";

  final FirebaseFirestore _firebaseFirestore;

  const CommentRepository(this._firebaseFirestore);

  Stream<List<Comment>> getNewsComments(newsId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_COMMENT)
        .where("news_id", isEqualTo: newsId)
        .snapshots()
        .map(
      (newsCommentSnaphot) {
        final newsComments = newsCommentSnaphot.docs.map(fromDoc).toList();
        newsComments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        return newsComments;
      },
    );
  }

  Stream<List<Comment>> getCommentsStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_COMMENT)
        .snapshots()
        .map((commentSnapshot) {
      final comments = commentSnapshot.docs.map(fromDoc).toList();
      comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return comments;
    });
  }

  Future<void> addComment(comment, userId, newsId, timestamp) async {
    CollectionReference comments =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_COMMENT);
    return comments.add({
      'comment': comment,
      'news_id': newsId,
      'user_id': userId,
      'createdAt': timestamp,
    });
  }

  Future<void> updateComment(comment, commentId) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.commentPath(commentId));
    return documentReference.update({
      COMMENT: comment,
    });
  }

  Future<void> deleteComment(commentId) {
    CollectionReference comments =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_COMMENT);

    return comments.doc(commentId).delete();
  }

  static Comment fromDoc(DocumentSnapshot document) {
    return Comment(
      (r) => r
        ..uid = document.id
        ..userId = document[USER_ID]
        ..newsId = document[NEWS_ID]
        ..comment = document[COMMENT]
        ..createdAt = document[CREATED_AT],
    );
  }
}
