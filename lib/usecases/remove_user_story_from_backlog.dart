import 'package:agile_backlog/repository/backlog_repository.dart';

class RemoveUserStoryFromBacklog {
  final BacklogRepository backlogRepository;

  RemoveUserStoryFromBacklog({
    this.backlogRepository,
  });

  void call(String userStoryId) =>
      backlogRepository.removeUserStory(userStoryId);
}
