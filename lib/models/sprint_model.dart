import 'package:agile_backlog/entity/sprint.dart';
import 'package:agile_backlog/entity/user_story.dart';
import 'package:flutter/material.dart';

class SprintModel extends Sprint {
  SprintModel({
    @required String id,
    @required String title,
    @required DateTime startDate,
    @required DateTime endDate,
    List<UserStory> userStories,
  }) : super(
          id: id,
          title: title,
          startDate: startDate,
          endDate: endDate,
          userStories: userStories,
        );

  SprintModel copyWith({
    String id,
    String title,
    DateTime startDate,
    DateTime endDate,
    List<UserStory> userStories,
  }) {
    return SprintModel(
      id: id ?? this.id,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      userStories: userStories ?? this.userStories,
    );
  }

  @override
  String toString() {
    return 'Sprint(id: $id, title: $title, startDate: $startDate, endDate: $endDate, userStories: $userStories)';
  }
}
