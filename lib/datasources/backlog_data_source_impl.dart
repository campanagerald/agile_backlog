import 'package:agile_backlog/models/user_model.dart';

import '../models/backlog_model.dart';
import '../models/user_story_model.dart';
import 'backlog_data_source.dart';

class BacklogDataSourceImpl implements BacklogDataSource {
  BacklogModel _backlog = BacklogModel(
    userStories: [
      UserStoryModel(
        id: '1',
        title:
            'As Max, I want to invite my friends, so we can enjoy this service together.',
        description: 'This is a description',
        assignee: UserModel(
          id: '1',
          avatarImageUrl: 'assets/images/joseph.png',
          name: 'Joseph',
        ),
        storyPoint: 3,
      ),
      UserStoryModel(
        id: '2',
        title:
            'As Sascha, I want to organize my work, so I can feel more in control.',
        description: 'This is a description',
        assignee: UserModel(
          id: '1',
          avatarImageUrl: 'assets/images/joseph.png',
          name: 'Joseph',
        ),
        storyPoint: 3,
      ),
    ],
  );

  @override
  BacklogModel getBacklog() => _backlog;

  @override
  void removeUserStory(String userStoryId) {
    _backlog.userStories
        .removeWhere((userStoryModel) => userStoryModel.id == userStoryId);
  }
}
