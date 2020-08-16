import 'package:flutter/material.dart';

import '../entity/user.dart';
import '../entity/user_story.dart';

class UserStoryModel extends UserStory {
  UserStoryModel({
    @required String id,
    @required String title,
    String description,
    User assignee,
    int storyPoint,
  }) : super(
          id: id,
          title: title,
          description: description,
          assignee: assignee,
          storyPoint: storyPoint,
        );

  @override
  String toString() {
    return 'UserStory(id: $id, title: $title, description: $description, assignee: $assignee, storyPoint: $storyPoint)';
  }
}
