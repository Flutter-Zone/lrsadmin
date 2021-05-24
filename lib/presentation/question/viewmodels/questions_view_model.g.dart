// GENERATED CODE - DO NOT MODIFY BY HAND

part of questions_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$QuestionsViewModel extends QuestionsViewModel {
  @override
  final BuiltList<Question> questions;

  factory _$QuestionsViewModel(
          [void Function(QuestionsViewModelBuilder) updates]) =>
      (new QuestionsViewModelBuilder()..update(updates)).build();

  _$QuestionsViewModel._({this.questions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questions, 'QuestionsViewModel', 'questions');
  }

  @override
  QuestionsViewModel rebuild(
          void Function(QuestionsViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  QuestionsViewModelBuilder toBuilder() =>
      new QuestionsViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is QuestionsViewModel && questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('QuestionsViewModel')
          ..add('questions', questions))
        .toString();
  }
}

class QuestionsViewModelBuilder
    implements Builder<QuestionsViewModel, QuestionsViewModelBuilder> {
  _$QuestionsViewModel _$v;

  ListBuilder<Question> _questions;
  ListBuilder<Question> get questions =>
      _$this._questions ??= new ListBuilder<Question>();
  set questions(ListBuilder<Question> questions) =>
      _$this._questions = questions;

  QuestionsViewModelBuilder();

  QuestionsViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questions = $v.questions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(QuestionsViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$QuestionsViewModel;
  }

  @override
  void update(void Function(QuestionsViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$QuestionsViewModel build() {
    _$QuestionsViewModel _$result;
    try {
      _$result =
          _$v ?? new _$QuestionsViewModel._(questions: questions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'QuestionsViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
