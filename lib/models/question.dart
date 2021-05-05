library question;

import 'package:built_value/built_value.dart';

part 'question.g.dart';

abstract class Question implements Built<Question, QuestionBuilder> {
  // fields go here
  String get uid;
  String get question;
  Question._();

  factory Question([updates(QuestionBuilder b)]) = _$Question;
}
