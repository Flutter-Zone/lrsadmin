// GENERATED CODE - DO NOT MODIFY BY HAND

part of news;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$News extends News {
  @override
  final String uid;
  @override
  final String title;
  @override
  final String subtitle;
  @override
  final String description;
  @override
  final String image;
  @override
  final BuiltList<dynamic> users;
  @override
  final Timestamp createdAt;

  factory _$News([void Function(NewsBuilder) updates]) =>
      (new NewsBuilder()..update(updates)).build();

  _$News._(
      {this.uid,
      this.title,
      this.subtitle,
      this.description,
      this.image,
      this.users,
      this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'News', 'uid');
    BuiltValueNullFieldError.checkNotNull(title, 'News', 'title');
    BuiltValueNullFieldError.checkNotNull(subtitle, 'News', 'subtitle');
    BuiltValueNullFieldError.checkNotNull(description, 'News', 'description');
    BuiltValueNullFieldError.checkNotNull(image, 'News', 'image');
    BuiltValueNullFieldError.checkNotNull(users, 'News', 'users');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'News', 'createdAt');
  }

  @override
  News rebuild(void Function(NewsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsBuilder toBuilder() => new NewsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is News &&
        uid == other.uid &&
        title == other.title &&
        subtitle == other.subtitle &&
        description == other.description &&
        image == other.image &&
        users == other.users &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, uid.hashCode), title.hashCode),
                        subtitle.hashCode),
                    description.hashCode),
                image.hashCode),
            users.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('News')
          ..add('uid', uid)
          ..add('title', title)
          ..add('subtitle', subtitle)
          ..add('description', description)
          ..add('image', image)
          ..add('users', users)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class NewsBuilder implements Builder<News, NewsBuilder> {
  _$News _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _subtitle;
  String get subtitle => _$this._subtitle;
  set subtitle(String subtitle) => _$this._subtitle = subtitle;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  ListBuilder<dynamic> _users;
  ListBuilder<dynamic> get users =>
      _$this._users ??= new ListBuilder<dynamic>();
  set users(ListBuilder<dynamic> users) => _$this._users = users;

  Timestamp _createdAt;
  Timestamp get createdAt => _$this._createdAt;
  set createdAt(Timestamp createdAt) => _$this._createdAt = createdAt;

  NewsBuilder();

  NewsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _title = $v.title;
      _subtitle = $v.subtitle;
      _description = $v.description;
      _image = $v.image;
      _users = $v.users.toBuilder();
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(News other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$News;
  }

  @override
  void update(void Function(NewsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$News build() {
    _$News _$result;
    try {
      _$result = _$v ??
          new _$News._(
              uid: BuiltValueNullFieldError.checkNotNull(uid, 'News', 'uid'),
              title:
                  BuiltValueNullFieldError.checkNotNull(title, 'News', 'title'),
              subtitle: BuiltValueNullFieldError.checkNotNull(
                  subtitle, 'News', 'subtitle'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, 'News', 'description'),
              image:
                  BuiltValueNullFieldError.checkNotNull(image, 'News', 'image'),
              users: users.build(),
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'News', 'createdAt'));
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'News', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
