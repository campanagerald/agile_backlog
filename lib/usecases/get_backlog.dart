import 'package:flutter/material.dart';

import '../entity/backlog.dart';
import '../repository/backlog_repository.dart';

class GetBacklog {
  final BacklogRepository backlogRepository;

  GetBacklog({
    @required this.backlogRepository,
  });

  Backlog call() {
    return backlogRepository.getBacklog();
  }
}
