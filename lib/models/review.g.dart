// GENERATED CODE - DO NOT MODIFY BY HAND

part of review;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Review extends Review {
  @override
  final String uid;
  @override
  final String userId;
  @override
  final String lecturerCourseId;
  @override
  final String courseId;
  @override
  final String lecturerId;
  @override
  final String comment;
  @override
  final double rating;
  @override
  final BuiltList<Map<String, dynamic>> questions;
  @override
  final Timestamp createdAt;

  factory _$Review([void Function(ReviewBuilder) updates]) =>
      (new ReviewBuilder()..update(updates)).build();

  _$Review._(
      {this.uid,
      this.userId,
      this.lecturerCourseId,
      this.courseId,
      this.lecturerId,
      this.comment,
      this.rating,
      this.questions,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Review', 'uid');
    BuiltValueNullFieldError.checkNotNull(userId, 'Review', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        lecturerCourseId, 'Review', 'lecturerCourseId');
    BuiltValueNullFieldError.checkNotNull(courseId, 'Review', 'courseId');
    BuiltValueNullFieldError.checkNotNull(lecturerId, 'Review', 'lecturerId');
    BuiltValueNullFieldError.checkNotNull(comment, 'Review', 'comment');
    BuiltValueNullFieldError.checkNotNull(rating, 'Review', 'rating');
    BuiltValueNullFieldError.checkNotNull(questions, 'Review', 'questions');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'Review', 'createdAt');
  }

  @override
  Review rebuild(void Function(ReviewBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewBuilder toBuilder() => new ReviewBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Review &&
        uid == other.uid &&
        userId == other.userId &&
        lecturerCourseId == other.lecturerCourseId &&
        courseId == other.courseId &&
        lecturerId == other.lecturerId &&
        comment == other.comment &&
        rating == other.rating &&
        questions == other.questions &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), userId.hashCode),
                                lecturerCourseId.hashCode),
                            courseId.hashCode),
                        lecturerId.hashCode),
                    comment.hashCode),
                rating.hashCode),
            questions.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Review')
          ..add('uid', uid)
          ..add('userId', userId)
          ..add('lecturerCourseId', lecturerCourseId)
          ..add('courseId', courseId)
          ..add('lecturerId', lecturerId)
          ..add('comment', comment)
          ..add('rating', rating)
          ..add('questions', questions)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class ReviewBuilder implements Builder<Review, ReviewBuilder> {
  _$Review _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _lecturerCourseId;
  String get lecturerCourseId => _$this._lecturerCourseId;
  set lecturerCourseId(String lecturerCourseId) =>
      _$this._lecturerCourseId = lecturerCourseId;

  String _courseId;
  String get courseId => _$this._courseId;
  set courseId(String courseId) => _$this._courseId = courseId;

  String _lecturerId;
  String get lecturerId => _$this._lecturerId;
  set lecturerId(String lecturerId) => _$this._lecturerId = lecturerId;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  ListBuilder<Map<String, dynamic>> _questions;
  ListBuilder<Map<String, dynamic>> get questions =>
      _$this._questions ??= new ListBuilder<Map<String, dynamic>>();
  set questions(ListBuilder<Map<String, dynamic>> questions) =>
      _$this._questions = questions;

  Timestamp _createdAt;
  Timestamp get createdAt => _$this._createdAt;
  set createdAt(Timestamp createdAt) => _$this._createdAt = createdAt;

  ReviewBuilder();

  ReviewBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _userId = $v.userId;
      _lecturerCourseId = $v.lecturerCourseId;
      _courseId = $v.courseId;
      _lecturerId = $v.lecturerId;
      _comment = $v.comment;
      _rating = $v.rating;
      _questions = $v.questions.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Review other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Review;
  }

  @override
  void update(void Function(ReviewBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Review build() {
    _$Review _$result;
    try {
      _$result = _$v ??
          new _$Review._(
              uid: BuiltValueNullFieldError.checkNotNull(uid, 'Review', 'uid'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, 'Review', 'userId'),
              lecturerCourseId: BuiltValueNullFieldError.checkNotNull(
                  lecturerCourseId, 'Review', 'lecturerCourseId'),
              courseId: BuiltValueNullFieldError.checkNotNull(
                  courseId, 'Review', 'courseId'),
              lecturerId: BuiltValueNullFieldError.checkNotNull(
                  lecturerId, 'Review', 'lecturerId'),
              comment: BuiltValueNullFieldError.checkNotNull(
                  comment, 'Review', 'comment'),
              rating: BuiltValueNullFieldError.checkNotNull(
                  rating, 'Review', 'rating'),
              questions: questions.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'Review', 'createdAt'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Review', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
