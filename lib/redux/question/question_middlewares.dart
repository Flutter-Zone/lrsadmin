import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/question_repository.dart';
import 'package:lrsadmin/redux/question/question_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createQuestionMiddleware(
  QuestionRepository questionRepository,
) {
  return [
    TypedMiddleware<AppState, AddQuestion>(_addQuestion(questionRepository)),
    TypedMiddleware<AppState, UpdateQuestion>(
        _updateQuestion(questionRepository)),
    TypedMiddleware<AppState, DeleteQuestion>(
        _deleteQuestion(questionRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddQuestion action,
  NextDispatcher next,
) _addQuestion(
  QuestionRepository questionRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await questionRepository.addQuestion(action.question);
      action.completer.complete("Question added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add question");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add question");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateQuestion action,
  NextDispatcher next,
) _updateQuestion(
  QuestionRepository questionRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await questionRepository.updateQuestion(
          action.question, action.questionId);
      action.completer.complete("Question updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update question");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update question");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteQuestion action,
  NextDispatcher next,
) _deleteQuestion(
  QuestionRepository questionRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await questionRepository.deleteQuestion(action.questionId);

      action.completer.complete("Question deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete question");
    } catch (error) {
      action.completer.completeError("Oops! Failed to delete question");
    }
  };
}
