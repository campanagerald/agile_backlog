// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backlog_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BacklogPageStore on _BacklogPageStoreBase, Store {
  final _$usersAtom = Atom(name: '_BacklogPageStoreBase.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$sprintsAtom = Atom(name: '_BacklogPageStoreBase.sprints');

  @override
  ObservableList<Sprint> get sprints {
    _$sprintsAtom.reportRead();
    return super.sprints;
  }

  @override
  set sprints(ObservableList<Sprint> value) {
    _$sprintsAtom.reportWrite(value, super.sprints, () {
      super.sprints = value;
    });
  }

  final _$backlogAtom = Atom(name: '_BacklogPageStoreBase.backlog');

  @override
  Backlog get backlog {
    _$backlogAtom.reportRead();
    return super.backlog;
  }

  @override
  set backlog(Backlog value) {
    _$backlogAtom.reportWrite(value, super.backlog, () {
      super.backlog = value;
    });
  }

  final _$_BacklogPageStoreBaseActionController =
      ActionController(name: '_BacklogPageStoreBase');

  @override
  void init() {
    final _$actionInfo = _$_BacklogPageStoreBaseActionController.startAction(
        name: '_BacklogPageStoreBase.init');
    try {
      return super.init();
    } finally {
      _$_BacklogPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addUserStoryToSprint(String sprintId, UserStory userStory) {
    final _$actionInfo = _$_BacklogPageStoreBaseActionController.startAction(
        name: '_BacklogPageStoreBase.addUserStoryToSprint');
    try {
      return super.addUserStoryToSprint(sprintId, userStory);
    } finally {
      _$_BacklogPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeUserStoryFromBacklog(String userStoryId) {
    final _$actionInfo = _$_BacklogPageStoreBaseActionController.startAction(
        name: '_BacklogPageStoreBase.removeUserStoryFromBacklog');
    try {
      return super.removeUserStoryFromBacklog(userStoryId);
    } finally {
      _$_BacklogPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
sprints: ${sprints},
backlog: ${backlog}
    ''';
  }
}
