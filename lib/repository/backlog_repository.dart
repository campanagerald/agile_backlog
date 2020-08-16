import '../entity/backlog.dart';

abstract class BacklogRepository {
  Backlog getBacklog();
  void removeUserStory(String userStoryId);
}
