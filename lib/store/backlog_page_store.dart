import 'package:agile_backlog/entity/user_story.dart';
import 'package:agile_backlog/usecases/add_user_story_to_sprint.dart';
import 'package:agile_backlog/usecases/remove_user_story_from_backlog.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../entity/backlog.dart';
import '../entity/sprint.dart';
import '../entity/user.dart';
import '../usecases/get_backlog.dart';
import '../usecases/get_sprints.dart';
import '../usecases/get_users.dart';

part 'backlog_page_store.g.dart';

class BacklogPageStore = _BacklogPageStoreBase with _$BacklogPageStore;

abstract class _BacklogPageStoreBase with Store {
  GetUsers _getUsers;
  GetSprints _getSprints;
  GetBacklog _getBacklog;
  AddUserStoryToSprint _addUserStoryToSprint;
  RemoveUserStoryFromBacklog _removeUserStoryFromBacklog;

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  ObservableList<Sprint> sprints = ObservableList<Sprint>();

  @observable
  Backlog backlog;

  _BacklogPageStoreBase({
    @required GetUsers getUsers,
    @required GetSprints getSprints,
    @required GetBacklog getBacklog,
    @required AddUserStoryToSprint addUserStoryToSprint,
    @required RemoveUserStoryFromBacklog removeUserStoryFromBacklog,
  }) {
    _getUsers = getUsers;
    _getSprints = getSprints;
    _getBacklog = getBacklog;
    _addUserStoryToSprint = addUserStoryToSprint;
    _removeUserStoryFromBacklog = removeUserStoryFromBacklog;
  }

  @action
  void init() {
    users = ObservableList<User>.of(_getUsers());
    sprints = ObservableList<Sprint>.of(_getSprints());
    backlog = _getBacklog();
  }

  @action
  void addUserStoryToSprint(String sprintId, UserStory userStory) {
    _addUserStoryToSprint(sprintId, userStory);
    sprints = ObservableList<Sprint>.of(_getSprints());
  }

  @action
  void removeUserStoryFromBacklog(String userStoryId) {
    _removeUserStoryFromBacklog(userStoryId);
    backlog = _getBacklog();
  }
}
