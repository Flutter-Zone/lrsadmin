// GENERATED CODE - DO NOT MODIFY BY HAND

part of question;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Question extends Question {
  @override
  final String uid;
  @override
  final String question;

  factory _$Question([void Function(QuestionBuilder) updates]) =>
      (new QuestionBuilder()..update(updates)).build();

  _$Question._({this.uid, this.question}) : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Question', 'uid');
    BuiltValueNullFieldError.checkNotNull(question, 'Question', 'question');
  }

  @override
  Question rebuild(void Function(QuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionBuilder toBuilder() => new QuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question && uid == other.uid && question == other.question;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, uid.hashCode), question.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Question')
          ..add('uid', uid)
          ..add('question', question))
        .toString();
  }
}

class QuestionBuilder implements Builder<Question, QuestionBuilder> {
  _$Question _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _question;
  String get question => _$this._question;
  set question(String question) => _$this._question = question;

  QuestionBuilder();

  QuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _question = $v.question;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Question other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Question;
  }

  @override
  void update(void Function(QuestionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Question build() {
    final _$result = _$v ??
        new _$Question._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Question', 'uid'),
            question: BuiltValueNullFieldError.checkNotNull(
                question, 'Question', 'question'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
