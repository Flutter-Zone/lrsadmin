library user;

import 'package:built_value/built_value.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  // fields go here
  String get uid;
  String get email;
  String get name;
  String get phone;
  String get image;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;
}
