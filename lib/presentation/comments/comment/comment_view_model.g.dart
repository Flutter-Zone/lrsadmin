// GENERATED CODE - DO NOT MODIFY BY HAND

part of comment_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CommentViewModel extends CommentViewModel {
  @override
  final BuiltList<Comment> comments;
  @override
  final BuiltList<User> users;
  @override
  final User user;

  factory _$CommentViewModel(
          [void Function(CommentViewModelBuilder) updates]) =>
      (new CommentViewModelBuilder()..update(updates)).build();

  _$CommentViewModel._({this.comments, this.users, this.user}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        comments, 'CommentViewModel', 'comments');
    BuiltValueNullFieldError.checkNotNull(users, 'CommentViewModel', 'users');
  }

  @override
  CommentViewModel rebuild(void Function(CommentViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentViewModelBuilder toBuilder() =>
      new CommentViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentViewModel &&
        comments == other.comments &&
        users == other.users &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, comments.hashCode), users.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CommentViewModel')
          ..add('comments', comments)
          ..add('users', users)
          ..add('user', user))
        .toString();
  }
}

class CommentViewModelBuilder
    implements Builder<CommentViewModel, CommentViewModelBuilder> {
  _$CommentViewModel _$v;

  ListBuilder<Comment> _comments;
  ListBuilder<Comment> get comments =>
      _$this._comments ??= new ListBuilder<Comment>();
  set comments(ListBuilder<Comment> comments) => _$this._comments = comments;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  CommentViewModelBuilder();

  CommentViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _comments = $v.comments.toBuilder();
      _users = $v.users.toBuilder();
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentViewModel;
  }

  @override
  void update(void Function(CommentViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CommentViewModel build() {
    _$CommentViewModel _$result;
    try {
      _$result = _$v ??
          new _$CommentViewModel._(
              comments: comments.build(),
              users: users.build(),
              user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'users';
        users.build();
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CommentViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
