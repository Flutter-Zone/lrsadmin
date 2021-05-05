// GENERATED CODE - DO NOT MODIFY BY HAND

part of lecturer_course;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LecturerCourse extends LecturerCourse {
  @override
  final String uid;
  @override
  final String courseId;
  @override
  final String lecturerId;
  @override
  final String day;
  @override
  final String time;

  factory _$LecturerCourse([void Function(LecturerCourseBuilder) updates]) =>
      (new LecturerCourseBuilder()..update(updates)).build();

  _$LecturerCourse._(
      {this.uid, this.courseId, this.lecturerId, this.day, this.time})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'LecturerCourse', 'uid');
    BuiltValueNullFieldError.checkNotNull(
        courseId, 'LecturerCourse', 'courseId');
    BuiltValueNullFieldError.checkNotNull(
        lecturerId, 'LecturerCourse', 'lecturerId');
    BuiltValueNullFieldError.checkNotNull(day, 'LecturerCourse', 'day');
    BuiltValueNullFieldError.checkNotNull(time, 'LecturerCourse', 'time');
  }

  @override
  LecturerCourse rebuild(void Function(LecturerCourseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LecturerCourseBuilder toBuilder() =>
      new LecturerCourseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LecturerCourse &&
        uid == other.uid &&
        courseId == other.courseId &&
        lecturerId == other.lecturerId &&
        day == other.day &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), courseId.hashCode),
                lecturerId.hashCode),
            day.hashCode),
        time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LecturerCourse')
          ..add('uid', uid)
          ..add('courseId', courseId)
          ..add('lecturerId', lecturerId)
          ..add('day', day)
          ..add('time', time))
        .toString();
  }
}

class LecturerCourseBuilder
    implements Builder<LecturerCourse, LecturerCourseBuilder> {
  _$LecturerCourse _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _courseId;
  String get courseId => _$this._courseId;
  set courseId(String courseId) => _$this._courseId = courseId;

  String _lecturerId;
  String get lecturerId => _$this._lecturerId;
  set lecturerId(String lecturerId) => _$this._lecturerId = lecturerId;

  String _day;
  String get day => _$this._day;
  set day(String day) => _$this._day = day;

  String _time;
  String get time => _$this._time;
  set time(String time) => _$this._time = time;

  LecturerCourseBuilder();

  LecturerCourseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _courseId = $v.courseId;
      _lecturerId = $v.lecturerId;
      _day = $v.day;
      _time = $v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LecturerCourse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LecturerCourse;
  }

  @override
  void update(void Function(LecturerCourseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LecturerCourse build() {
    final _$result = _$v ??
        new _$LecturerCourse._(
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, 'LecturerCourse', 'uid'),
            courseId: BuiltValueNullFieldError.checkNotNull(
                courseId, 'LecturerCourse', 'courseId'),
            lecturerId: BuiltValueNullFieldError.checkNotNull(
                lecturerId, 'LecturerCourse', 'lecturerId'),
            day: BuiltValueNullFieldError.checkNotNull(
                day, 'LecturerCourse', 'day'),
            time: BuiltValueNullFieldError.checkNotNull(
                time, 'LecturerCourse', 'time'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
