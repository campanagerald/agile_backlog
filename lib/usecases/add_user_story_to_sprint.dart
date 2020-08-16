import 'package:flutter/material.dart';

import '../repository/sprint_repository.dart';

class AddUserStoryToSprint {
  final SprintRepository sprintRepository;

  AddUserStoryToSprint({@required this.sprintRepository});

  void call(sprintId, userStory) {
    return sprintRepository.addUserStory(sprintId, userStory);
  }
}
