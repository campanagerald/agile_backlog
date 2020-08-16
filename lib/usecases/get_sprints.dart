import 'package:flutter/material.dart';

import '../entity/sprint.dart';
import '../repository/sprint_repository.dart';

class GetSprints {
  final SprintRepository sprintRepository;

  GetSprints({
    @required this.sprintRepository,
  });

  List<Sprint> call() {
    return sprintRepository.getSprints();
  }
}
