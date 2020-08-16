import '../entity/user_story.dart';
import '../models/sprint_model.dart';

abstract class SprintDataSource {
  List<SprintModel> getSprints();
  void addUserStory(String sprintId, UserStory userStory);
}
