import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

import 'firebase_paths.dart';

class QuestionRepository {
  static const QUESTION = "question";

  final FirebaseFirestore _firebaseFirestore;

  const QuestionRepository(this._firebaseFirestore);

  Stream<List<Question>> getQuestionsStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_QUESTIONS)
        .snapshots()
        .map((quetionsSnapshot) {
      final questions = quetionsSnapshot.docs.map(fromDoc).toList();
      return questions;
    });
  }

  static Question fromDoc(DocumentSnapshot document) {
    return Question(
      (r) => r
        ..uid = document.id
        ..question = document[QUESTION],
    );
  }
}
