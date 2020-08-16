import 'package:agile_backlog/datasources/sprint_data_source.dart';
import 'package:agile_backlog/entity/user_story.dart';
import 'package:agile_backlog/repository/sprint_repository.dart';
import 'package:flutter/material.dart';

import '../entity/sprint.dart';

class SprintRepositoryImpl implements SprintRepository {
  SprintDataSource sprintDataSource;

  SprintRepositoryImpl({
    @required this.sprintDataSource,
  });

  @override
  List<Sprint> getSprints() {
    return sprintDataSource.getSprints();
  }

  @override
  void addUserStory(String sprintId, UserStory userStory) {
    sprintDataSource.addUserStory(sprintId, userStory);
  }
}
