import 'dart:io';

import 'package:flutter/material.dart';
import '../../models/user.dart';

@immutable
class ChangeAvatarAction {
  final File file;
  final User user;

  const ChangeAvatarAction({
    @required this.file,
    @required this.user,
  });
}
