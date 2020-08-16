import '../models/user_model.dart';
import 'user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final List<UserModel> _users = [
    UserModel(
      id: '1',
      avatarImageUrl: 'assets/images/joseph.png',
      name: 'Joseph',
    ),
    UserModel(
      id: '2',
      avatarImageUrl: 'assets/images/mary.png',
      name: 'Mary',
    ),
  ];

  @override
  List<UserModel> getUsers() {
    return _users;
  }
}
