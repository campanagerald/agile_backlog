import 'package:flutter/material.dart';

import '../entity/user.dart';
import '../repository/user_repository.dart';

class GetUsers {
  final UserRepository userRepository;

  GetUsers({
    @required this.userRepository,
  });

  List<User> call() {
    return userRepository.getUsers();
  }
}
