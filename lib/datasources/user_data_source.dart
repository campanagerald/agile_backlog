import 'package:agile_backlog/models/user_model.dart';

abstract class UserDataSource {
  List<UserModel> getUsers();
}
