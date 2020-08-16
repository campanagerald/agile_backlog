import 'package:flutter/material.dart';

import '../entity/user.dart';

class UserModel extends User {
  UserModel({
    @required String id,
    @required String avatarImageUrl,
    @required String name,
  }) : super(id: id, avatarImageUrl: avatarImageUrl, name: name);

  @override
  String toString() =>
      'User(id: $id, avatarImageUrl: $avatarImageUrl, name: $name)';
}
