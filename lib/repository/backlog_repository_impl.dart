import 'package:flutter/material.dart';

import '../datasources/backlog_data_source.dart';
import '../entity/backlog.dart';
import 'backlog_repository.dart';

class BacklogRepositoryImpl implements BacklogRepository {
  BacklogDataSource backlogDataSource;

  BacklogRepositoryImpl({
    @required this.backlogDataSource,
  });

  @override
  Backlog getBacklog() {
    return backlogDataSource.getBacklog();
  }

  @override
  void removeUserStory(String userStoryId) {
    backlogDataSource.removeUserStory(userStoryId);
  }
}
