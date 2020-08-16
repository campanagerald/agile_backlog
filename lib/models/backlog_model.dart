import 'package:agile_backlog/entity/backlog.dart';
import 'package:agile_backlog/entity/user_story.dart';

class BacklogModel extends Backlog {
  BacklogModel({
    List<UserStory> userStories,
  }) : super(userStories: userStories);

  BacklogModel copyWith({
    List<UserStory> userStories,
  }) {
    return BacklogModel(
      userStories: userStories ?? this.userStories,
    );
  }

  @override
  String toString() => 'Backlog(userStories: $userStories)';
}
