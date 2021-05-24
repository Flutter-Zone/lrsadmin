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

  Future<void> addQuestion(question) async {
    CollectionReference questions =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_QUESTIONS);
    return questions.add({
      QUESTION: question,
    });
  }

  Future<void> updateQuestion(question, questionId) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.questionPath(questionId));
    return documentReference.update({
      QUESTION: question,
    });
  }

  Future<void> deleteQuestion(questionId) {
    CollectionReference questions =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_QUESTIONS);

    return questions.doc(questionId).delete();
  }

  static Question fromDoc(DocumentSnapshot document) {
    return Question(
      (r) => r
        ..uid = document.id
        ..question = document[QUESTION],
    );
  }
}
