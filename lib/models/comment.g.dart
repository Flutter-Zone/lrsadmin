// GENERATED CODE - DO NOT MODIFY BY HAND

part of comment;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Comment extends Comment {
  @override
  final String uid;
  @override
  final String userId;
  @override
  final String newsId;
  @override
  final String comment;
  @override
  final Timestamp createdAt;

  factory _$Comment([void Function(CommentBuilder) updates]) =>
      (new CommentBuilder()..update(updates)).build();

  _$Comment._(
      {this.uid, this.userId, this.newsId, this.comment, this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Comment', 'uid');
    BuiltValueNullFieldError.checkNotNull(userId, 'Comment', 'userId');
    BuiltValueNullFieldError.checkNotNull(newsId, 'Comment', 'newsId');
    BuiltValueNullFieldError.checkNotNull(comment, 'Comment', 'comment');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'Comment', 'createdAt');
  }

  @override
  Comment rebuild(void Function(CommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentBuilder toBuilder() => new CommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
        uid == other.uid &&
        userId == other.userId &&
        newsId == other.newsId &&
        comment == other.comment &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid.hashCode), userId.hashCode), newsId.hashCode),
            comment.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Comment')
          ..add('uid', uid)
          ..add('userId', userId)
          ..add('newsId', newsId)
          ..add('comment', comment)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class CommentBuilder implements Builder<Comment, CommentBuilder> {
  _$Comment _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _newsId;
  String get newsId => _$this._newsId;
  set newsId(String newsId) => _$this._newsId = newsId;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  Timestamp _createdAt;
  Timestamp get createdAt => _$this._createdAt;
  set createdAt(Timestamp createdAt) => _$this._createdAt = createdAt;

  CommentBuilder();

  CommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _userId = $v.userId;
      _newsId = $v.newsId;
      _comment = $v.comment;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Comment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Comment;
  }

  @override
  void update(void Function(CommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Comment build() {
    final _$result = _$v ??
        new _$Comment._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Comment', 'uid'),
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, 'Comment', 'userId'),
            newsId: BuiltValueNullFieldError.checkNotNull(
                newsId, 'Comment', 'newsId'),
            comment: BuiltValueNullFieldError.checkNotNull(
                comment, 'Comment', 'comment'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'Comment', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
