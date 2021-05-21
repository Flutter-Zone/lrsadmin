// GENERATED CODE - DO NOT MODIFY BY HAND

part of courses_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CoursesViewModel extends CoursesViewModel {
  @override
  final BuiltList<Course> courses;

  factory _$CoursesViewModel(
          [void Function(CoursesViewModelBuilder) updates]) =>
      (new CoursesViewModelBuilder()..update(updates)).build();

  _$CoursesViewModel._({this.courses}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        courses, 'CoursesViewModel', 'courses');
  }

  @override
  CoursesViewModel rebuild(void Function(CoursesViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoursesViewModelBuilder toBuilder() =>
      new CoursesViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoursesViewModel && courses == other.courses;
  }

  @override
  int get hashCode {
    return $jf($jc(0, courses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CoursesViewModel')
          ..add('courses', courses))
        .toString();
  }
}

class CoursesViewModelBuilder
    implements Builder<CoursesViewModel, CoursesViewModelBuilder> {
  _$CoursesViewModel _$v;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  CoursesViewModelBuilder();

  CoursesViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CoursesViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoursesViewModel;
  }

  @override
  void update(void Function(CoursesViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CoursesViewModel build() {
    _$CoursesViewModel _$result;
    try {
      _$result = _$v ?? new _$CoursesViewModel._(courses: courses.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CoursesViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
