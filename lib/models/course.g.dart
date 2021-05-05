// GENERATED CODE - DO NOT MODIFY BY HAND

part of course;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Course extends Course {
  @override
  final String uid;
  @override
  final String title;
  @override
  final String description;
  @override
  final double creditHours;

  factory _$Course([void Function(CourseBuilder) updates]) =>
      (new CourseBuilder()..update(updates)).build();

  _$Course._({this.uid, this.title, this.description, this.creditHours})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Course', 'uid');
    BuiltValueNullFieldError.checkNotNull(title, 'Course', 'title');
    BuiltValueNullFieldError.checkNotNull(description, 'Course', 'description');
    BuiltValueNullFieldError.checkNotNull(creditHours, 'Course', 'creditHours');
  }

  @override
  Course rebuild(void Function(CourseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CourseBuilder toBuilder() => new CourseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Course &&
        uid == other.uid &&
        title == other.title &&
        description == other.description &&
        creditHours == other.creditHours;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uid.hashCode), title.hashCode), description.hashCode),
        creditHours.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Course')
          ..add('uid', uid)
          ..add('title', title)
          ..add('description', description)
          ..add('creditHours', creditHours))
        .toString();
  }
}

class CourseBuilder implements Builder<Course, CourseBuilder> {
  _$Course _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  double _creditHours;
  double get creditHours => _$this._creditHours;
  set creditHours(double creditHours) => _$this._creditHours = creditHours;

  CourseBuilder();

  CourseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _title = $v.title;
      _description = $v.description;
      _creditHours = $v.creditHours;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Course other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Course;
  }

  @override
  void update(void Function(CourseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Course build() {
    final _$result = _$v ??
        new _$Course._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Course', 'uid'),
            title:
                BuiltValueNullFieldError.checkNotNull(title, 'Course', 'title'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Course', 'description'),
            creditHours: BuiltValueNullFieldError.checkNotNull(
                creditHours, 'Course', 'creditHours'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
