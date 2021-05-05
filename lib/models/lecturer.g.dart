// GENERATED CODE - DO NOT MODIFY BY HAND

part of lecturer;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Lecturer extends Lecturer {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String image;
  @override
  final String facultyId;

  factory _$Lecturer([void Function(LecturerBuilder) updates]) =>
      (new LecturerBuilder()..update(updates)).build();

  _$Lecturer._(
      {this.uid, this.name, this.email, this.phone, this.image, this.facultyId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Lecturer', 'uid');
    BuiltValueNullFieldError.checkNotNull(name, 'Lecturer', 'name');
    BuiltValueNullFieldError.checkNotNull(email, 'Lecturer', 'email');
    BuiltValueNullFieldError.checkNotNull(phone, 'Lecturer', 'phone');
    BuiltValueNullFieldError.checkNotNull(image, 'Lecturer', 'image');
    BuiltValueNullFieldError.checkNotNull(facultyId, 'Lecturer', 'facultyId');
  }

  @override
  Lecturer rebuild(void Function(LecturerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LecturerBuilder toBuilder() => new LecturerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Lecturer &&
        uid == other.uid &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        image == other.image &&
        facultyId == other.facultyId;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, uid.hashCode), name.hashCode), email.hashCode),
                phone.hashCode),
            image.hashCode),
        facultyId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Lecturer')
          ..add('uid', uid)
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('image', image)
          ..add('facultyId', facultyId))
        .toString();
  }
}

class LecturerBuilder implements Builder<Lecturer, LecturerBuilder> {
  _$Lecturer _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  String _facultyId;
  String get facultyId => _$this._facultyId;
  set facultyId(String facultyId) => _$this._facultyId = facultyId;

  LecturerBuilder();

  LecturerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _email = $v.email;
      _phone = $v.phone;
      _image = $v.image;
      _facultyId = $v.facultyId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Lecturer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Lecturer;
  }

  @override
  void update(void Function(LecturerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Lecturer build() {
    final _$result = _$v ??
        new _$Lecturer._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Lecturer', 'uid'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Lecturer', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'Lecturer', 'email'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, 'Lecturer', 'phone'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, 'Lecturer', 'image'),
            facultyId: BuiltValueNullFieldError.checkNotNull(
                facultyId, 'Lecturer', 'facultyId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
