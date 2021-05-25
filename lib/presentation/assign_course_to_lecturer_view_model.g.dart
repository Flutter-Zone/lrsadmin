// GENERATED CODE - DO NOT MODIFY BY HAND

part of assign_course_to_lecturer_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssignCourseToLecturerViewModel
    extends AssignCourseToLecturerViewModel {
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<Course> courses;

  factory _$AssignCourseToLecturerViewModel(
          [void Function(AssignCourseToLecturerViewModelBuilder) updates]) =>
      (new AssignCourseToLecturerViewModelBuilder()..update(updates)).build();

  _$AssignCourseToLecturerViewModel._({this.lecturers, this.courses})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lecturers, 'AssignCourseToLecturerViewModel', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(
        courses, 'AssignCourseToLecturerViewModel', 'courses');
  }

  @override
  AssignCourseToLecturerViewModel rebuild(
          void Function(AssignCourseToLecturerViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssignCourseToLecturerViewModelBuilder toBuilder() =>
      new AssignCourseToLecturerViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssignCourseToLecturerViewModel &&
        lecturers == other.lecturers &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lecturers.hashCode), courses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssignCourseToLecturerViewModel')
          ..add('lecturers', lecturers)
          ..add('courses', courses))
        .toString();
  }
}

class AssignCourseToLecturerViewModelBuilder
    implements
        Builder<AssignCourseToLecturerViewModel,
            AssignCourseToLecturerViewModelBuilder> {
  _$AssignCourseToLecturerViewModel _$v;

  ListBuilder<Lecturer> _lecturers;
  ListBuilder<Lecturer> get lecturers =>
      _$this._lecturers ??= new ListBuilder<Lecturer>();
  set lecturers(ListBuilder<Lecturer> lecturers) =>
      _$this._lecturers = lecturers;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  AssignCourseToLecturerViewModelBuilder();

  AssignCourseToLecturerViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lecturers = $v.lecturers.toBuilder();
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssignCourseToLecturerViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AssignCourseToLecturerViewModel;
  }

  @override
  void update(void Function(AssignCourseToLecturerViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssignCourseToLecturerViewModel build() {
    _$AssignCourseToLecturerViewModel _$result;
    try {
      _$result = _$v ??
          new _$AssignCourseToLecturerViewModel._(
              lecturers: lecturers.build(), courses: courses.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lecturers';
        lecturers.build();
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AssignCourseToLecturerViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
