import 'package:agile_backlog/entity/user.dart';

abstract class UserRepository {
  List<User> getUsers();
}
