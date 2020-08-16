import 'package:agile_backlog/datasources/backlog_data_source_impl.dart';
import 'package:agile_backlog/datasources/sprint_data_source_impl.dart';
import 'package:agile_backlog/datasources/user_data_source_impl.dart';
import 'package:agile_backlog/repository/backlog_repository_impl.dart';
import 'package:agile_backlog/repository/sprint_repository_impl.dart';
import 'package:agile_backlog/repository/user_repository_impl.dart';
import 'package:agile_backlog/usecases/add_user_story_to_sprint.dart';
import 'package:agile_backlog/usecases/get_backlog.dart';
import 'package:agile_backlog/usecases/get_sprints.dart';
import 'package:agile_backlog/usecases/remove_user_story_from_backlog.dart';

import 'pages/backlog_page.dart';
import 'store/backlog_page_store.dart';
import 'usecases/get_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

// I know this is stupid, I should use getit
UserRepositoryImpl userRepositoryImpl = UserRepositoryImpl(
  userDataSource: UserDataSourceImpl(),
);

SprintRepositoryImpl sprintRepositoryImpl = SprintRepositoryImpl(
  sprintDataSource: SprintDataSourceImpl(),
);

BacklogRepositoryImpl backlogRepositoryImpl = BacklogRepositoryImpl(
  backlogDataSource: BacklogDataSourceImpl(),
);

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          Provider<BacklogPageStore>(
            create: (_) => BacklogPageStore(
              getUsers: GetUsers(userRepository: userRepositoryImpl),
              getSprints: GetSprints(sprintRepository: sprintRepositoryImpl),
              getBacklog: GetBacklog(backlogRepository: backlogRepositoryImpl),
              addUserStoryToSprint: AddUserStoryToSprint(
                sprintRepository: sprintRepositoryImpl,
              ),
              removeUserStoryFromBacklog: RemoveUserStoryFromBacklog(
                  backlogRepository: backlogRepositoryImpl),
            ),
          ),
        ],
        child: BacklogPage(),
      ),
    );
  }
}
