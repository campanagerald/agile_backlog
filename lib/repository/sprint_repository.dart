import '../entity/sprint.dart';
import '../entity/user_story.dart';

abstract class SprintRepository {
  List<Sprint> getSprints();
  void addUserStory(String sprintId, UserStory userStory);
}
