import '../models/backlog_model.dart';

abstract class BacklogDataSource {
  BacklogModel getBacklog();
  void removeUserStory(String userStoryId);
}
