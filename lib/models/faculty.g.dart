// GENERATED CODE - DO NOT MODIFY BY HAND

part of faculty;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Faculty extends Faculty {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String description;
  @override
  final String image;

  factory _$Faculty([void Function(FacultyBuilder) updates]) =>
      (new FacultyBuilder()..update(updates)).build();

  _$Faculty._({this.uid, this.name, this.description, this.image}) : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Faculty', 'uid');
    BuiltValueNullFieldError.checkNotNull(name, 'Faculty', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, 'Faculty', 'description');
    BuiltValueNullFieldError.checkNotNull(image, 'Faculty', 'image');
  }

  @override
  Faculty rebuild(void Function(FacultyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FacultyBuilder toBuilder() => new FacultyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Faculty &&
        uid == other.uid &&
        name == other.name &&
        description == other.description &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uid.hashCode), name.hashCode), description.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Faculty')
          ..add('uid', uid)
          ..add('name', name)
          ..add('description', description)
          ..add('image', image))
        .toString();
  }
}

class FacultyBuilder implements Builder<Faculty, FacultyBuilder> {
  _$Faculty _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  FacultyBuilder();

  FacultyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _description = $v.description;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Faculty other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Faculty;
  }

  @override
  void update(void Function(FacultyBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Faculty build() {
    final _$result = _$v ??
        new _$Faculty._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Faculty', 'uid'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Faculty', 'name'),
            description: BuiltValueNullFieldError.checkNotNull(
                description, 'Faculty', 'description'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, 'Faculty', 'image'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
