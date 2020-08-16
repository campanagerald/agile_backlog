import 'package:agile_backlog/datasources/sprint_data_source.dart';
import 'package:agile_backlog/entity/user_story.dart';
import 'package:agile_backlog/models/sprint_model.dart';

class SprintDataSourceImpl implements SprintDataSource {
  List<SprintModel> _sprints = [
    SprintModel(
      id: '1',
      title: 'Sprint 1',
      startDate: DateTime.now().add(
        Duration(days: 2),
      ),
      endDate: DateTime.now().add(
        Duration(days: 14),
      ),
      userStories: [],
    ),
    SprintModel(
      id: '2',
      title: 'Sprint 2',
      startDate: DateTime.now().add(
        Duration(days: 16),
      ),
      endDate: DateTime.now().add(
        Duration(days: 28),
      ),
      userStories: [],
    )
  ];

  @override
  List<SprintModel> getSprints() {
    return _sprints;
  }

  @override
  void addUserStory(String sprintId, UserStory userStory) {
    final sprint = _sprints.firstWhere((sprint) => sprint.id == sprintId);
    final sprintIndex = _sprints.indexOf(sprint);

    sprint.copyWith(
      userStories: sprint.userStories..add(userStory),
    );

    _sprints[sprintIndex] = sprint;
  }
}
