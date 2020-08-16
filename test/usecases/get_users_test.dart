import 'package:agile_backlog/entity/user.dart';
import 'package:agile_backlog/repository/user_repository.dart';
import 'package:agile_backlog/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

main() {
  MockUserRepository mockUserRepository;
  GetUsers getUsers;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUsers = GetUsers(userRepository: mockUserRepository);
  });

  test(
    'shoud return List<User>',
    () async {
      // arrange
      final List<User> tUsers = [
        User(
            id: DateTime.now().toString(),
            avatarImageUrl: 'assets/images/joseph.png',
            name: 'Joseph'),
        User(
            id: DateTime.now().toString(),
            avatarImageUrl: 'assets/images/mary.png',
            name: 'Mary')
      ];

      when(mockUserRepository.getUsers()).thenReturn(tUsers);

      // act
      final result = getUsers.call();

      // assert
      verify(mockUserRepository.getUsers());
      expect(result, equals(tUsers));
    },
  );

  test(
    'shoud return empty list',
    () async {
      // arrange
      final List<User> tUsers = [];
      when(mockUserRepository.getUsers()).thenReturn(tUsers);

      // act
      final result = getUsers.call();

      // assert
      verify(mockUserRepository.getUsers());
      expect(result, equals(tUsers));
    },
  );
}
