import 'package:flutter/material.dart';

import 'user.dart';

class UserStory {
  final String id;
  final String title;
  final String description;
  final User assignee;
  final int storyPoint;

  UserStory({
    @required this.id,
    @required this.title,
    this.description,
    this.assignee,
    this.storyPoint,
  });
}
