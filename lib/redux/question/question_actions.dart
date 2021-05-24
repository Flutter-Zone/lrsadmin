import 'dart:async';

class AddQuestion {
  final String question;
  final Completer completer;

  AddQuestion({
    this.question,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class UpdateQuestion {
  final String question;
  final String questionId;
  final Completer completer;

  UpdateQuestion({
    this.question,
    this.questionId,
    Completer completer,
  }) : completer = completer ?? Completer();
}

class DeleteQuestion {
  final String questionId;
  final Completer completer;

  DeleteQuestion({this.questionId, Completer completer})
      : completer = completer ?? Completer();
}
