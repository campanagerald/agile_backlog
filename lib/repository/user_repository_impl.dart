import 'package:agile_backlog/datasources/user_data_source.dart';
import 'package:agile_backlog/entity/user.dart';
import 'package:agile_backlog/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({this.userDataSource});

  @override
  List<User> getUsers() => userDataSource.getUsers();
}
