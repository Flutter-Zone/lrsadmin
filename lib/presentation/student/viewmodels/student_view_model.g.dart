// GENERATED CODE - DO NOT MODIFY BY HAND

part of student_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StudentsViewModel extends StudentsViewModel {
  @override
  final BuiltList<User> users;

  factory _$StudentsViewModel(
          [void Function(StudentsViewModelBuilder) updates]) =>
      (new StudentsViewModelBuilder()..update(updates)).build();

  _$StudentsViewModel._({this.users}) : super._() {
    BuiltValueNullFieldError.checkNotNull(users, 'StudentsViewModel', 'users');
  }

  @override
  StudentsViewModel rebuild(void Function(StudentsViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentsViewModelBuilder toBuilder() =>
      new StudentsViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentsViewModel && users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(0, users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StudentsViewModel')
          ..add('users', users))
        .toString();
  }
}

class StudentsViewModelBuilder
    implements Builder<StudentsViewModel, StudentsViewModelBuilder> {
  _$StudentsViewModel _$v;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  StudentsViewModelBuilder();

  StudentsViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentsViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentsViewModel;
  }

  @override
  void update(void Function(StudentsViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StudentsViewModel build() {
    _$StudentsViewModel _$result;
    try {
      _$result = _$v ?? new _$StudentsViewModel._(users: users.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StudentsViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
