// GENERATED CODE - DO NOT MODIFY BY HAND

part of add_lecturer_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddLecturersViewModel extends AddLecturersViewModel {
  @override
  final BuiltList<Faculty> faculties;

  factory _$AddLecturersViewModel(
          [void Function(AddLecturersViewModelBuilder) updates]) =>
      (new AddLecturersViewModelBuilder()..update(updates)).build();

  _$AddLecturersViewModel._({this.faculties}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        faculties, 'AddLecturersViewModel', 'faculties');
  }

  @override
  AddLecturersViewModel rebuild(
          void Function(AddLecturersViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddLecturersViewModelBuilder toBuilder() =>
      new AddLecturersViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddLecturersViewModel && faculties == other.faculties;
  }

  @override
  int get hashCode {
    return $jf($jc(0, faculties.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AddLecturersViewModel')
          ..add('faculties', faculties))
        .toString();
  }
}

class AddLecturersViewModelBuilder
    implements Builder<AddLecturersViewModel, AddLecturersViewModelBuilder> {
  _$AddLecturersViewModel _$v;

  ListBuilder<Faculty> _faculties;
  ListBuilder<Faculty> get faculties =>
      _$this._faculties ??= new ListBuilder<Faculty>();
  set faculties(ListBuilder<Faculty> faculties) =>
      _$this._faculties = faculties;

  AddLecturersViewModelBuilder();

  AddLecturersViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _faculties = $v.faculties.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddLecturersViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddLecturersViewModel;
  }

  @override
  void update(void Function(AddLecturersViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddLecturersViewModel build() {
    _$AddLecturersViewModel _$result;
    try {
      _$result =
          _$v ?? new _$AddLecturersViewModel._(faculties: faculties.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'faculties';
        faculties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddLecturersViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
