// GENERATED CODE - DO NOT MODIFY BY HAND

part of faculty_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FacultyViewModel extends FacultyViewModel {
  @override
  final BuiltList<Faculty> faculties;

  factory _$FacultyViewModel(
          [void Function(FacultyViewModelBuilder) updates]) =>
      (new FacultyViewModelBuilder()..update(updates)).build();

  _$FacultyViewModel._({this.faculties}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        faculties, 'FacultyViewModel', 'faculties');
  }

  @override
  FacultyViewModel rebuild(void Function(FacultyViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FacultyViewModelBuilder toBuilder() =>
      new FacultyViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FacultyViewModel && faculties == other.faculties;
  }

  @override
  int get hashCode {
    return $jf($jc(0, faculties.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FacultyViewModel')
          ..add('faculties', faculties))
        .toString();
  }
}

class FacultyViewModelBuilder
    implements Builder<FacultyViewModel, FacultyViewModelBuilder> {
  _$FacultyViewModel _$v;

  ListBuilder<Faculty> _faculties;
  ListBuilder<Faculty> get faculties =>
      _$this._faculties ??= new ListBuilder<Faculty>();
  set faculties(ListBuilder<Faculty> faculties) =>
      _$this._faculties = faculties;

  FacultyViewModelBuilder();

  FacultyViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _faculties = $v.faculties.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FacultyViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FacultyViewModel;
  }

  @override
  void update(void Function(FacultyViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FacultyViewModel build() {
    _$FacultyViewModel _$result;
    try {
      _$result = _$v ?? new _$FacultyViewModel._(faculties: faculties.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'faculties';
        faculties.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FacultyViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
