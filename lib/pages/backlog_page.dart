import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../entity/user_story.dart';
import '../store/backlog_page_store.dart';
import '../widgets/sprint_expansion_panel_list.dart';

class BacklogPage extends StatefulWidget {
  const BacklogPage({Key key}) : super(key: key);

  @override
  _BacklogPageState createState() => _BacklogPageState();
}

class _BacklogPageState extends State<BacklogPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<BacklogPageStore>(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Backlog'),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildUsersAvatar(context),
        _buildSprints(context),
        _buildBacklogList(context),
      ],
    );
  }

  _buildUsersAvatar(BuildContext context) {
    final BacklogPageStore backlogPageStore =
        Provider.of<BacklogPageStore>(context);

    return Observer(
      builder: (_) {
        return Row(
          children: backlogPageStore.users
              .map(
                (user) => Padding(
                  key: ValueKey(user.id),
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(user.avatarImageUrl),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  _buildSprints(BuildContext context) {
    final BacklogPageStore backlogPageStore =
        Provider.of<BacklogPageStore>(context);

    return Observer(builder: (_) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: SprintExpansionPanelList(
                sprintExpansionPanelItems: backlogPageStore.sprints
                    .map((sprint) => SprintExpansionPanelItem(sprint: sprint))
                    .toList(),
              ),
            ),
          ),
        ),
      );
    });
  }

  _buildBacklogList(BuildContext context) {
    final BacklogPageStore backlogPageStore =
        Provider.of<BacklogPageStore>(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        margin: const EdgeInsets.all(5),
        child: Observer(builder: (_) {
          final backlog = backlogPageStore.backlog;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Backlog',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: backlog.userStories.length,
                  itemBuilder: (_, i) {
                    return Draggable<UserStory>(
                      onDragCompleted: () {
                        backlogPageStore.removeUserStoryFromBacklog(
                            backlog.userStories[i].id);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(backlog.userStories[i].title),
                        ),
                      ),
                      data: backlog.userStories[i],
                      childWhenDragging: Container(),
                      feedback: Container(
                        height: 25,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: FittedBox(
                            child: Text(
                              backlog.userStories[i].title,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
