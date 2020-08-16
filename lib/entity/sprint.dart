import 'package:flutter/material.dart';

import 'package:agile_backlog/entity/user_story.dart';

class Sprint {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final List<UserStory> userStories;

  Sprint({
    @required this.id,
    @required this.title,
    @required this.startDate,
    @required this.endDate,
    this.userStories,
  });
}
