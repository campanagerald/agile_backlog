import 'package:agile_backlog/pages/user_story_detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entity/sprint.dart';
import '../entity/user_story.dart';
import '../store/backlog_page_store.dart';
import 'sprint_expansion_panel_drag_target.dart';

class SprintExpansionPanelItem {
  final Sprint sprint;
  final bool isExpanded;

  SprintExpansionPanelItem({
    @required this.sprint,
    this.isExpanded = false,
  });

  SprintExpansionPanelItem copyWith({
    Sprint sprint,
    bool isExpanded,
  }) {
    return SprintExpansionPanelItem(
      sprint: sprint ?? this.sprint,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class SprintExpansionPanelList extends StatefulWidget {
  final List<SprintExpansionPanelItem> sprintExpansionPanelItems;

  SprintExpansionPanelList({
    Key key,
    @required this.sprintExpansionPanelItems,
  }) : super(key: key);

  @override
  SprintExpansionPanelListState createState() =>
      SprintExpansionPanelListState();
}

class SprintExpansionPanelListState extends State<SprintExpansionPanelList> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (i, isExpanded) {
        setState(
          () {
            widget.sprintExpansionPanelItems[i] =
                widget.sprintExpansionPanelItems[i].copyWith(
              isExpanded: !isExpanded,
            );
          },
        );
      },
      children: widget.sprintExpansionPanelItems.map(
        (sprintExpansionPanelItem) {
          return ExpansionPanel(
            headerBuilder: (_, isExpanded) {
              return ListTile(
                title: Text(sprintExpansionPanelItem.sprint.title),
              );
            },
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: sprintExpansionPanelItem.sprint.userStories.length + 1,
              itemBuilder: (_, i) {
                if (i == sprintExpansionPanelItem.sprint.userStories.length) {
                  return SprintExpansionPanelDragTarget(
                    onAccept: (userStory) => _dragTargetOnAccept(
                        context, sprintExpansionPanelItem.sprint.id, userStory),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Provider<UserStory>(
                              create: (_) => sprintExpansionPanelItem
                                  .sprint.userStories[i],
                              child: UserStoryDetailedPage()),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: ListTile(
                        title: Text(sprintExpansionPanelItem
                            .sprint.userStories[i].title),
                      ),
                    ),
                  );
                }
              },
            ),
            isExpanded: sprintExpansionPanelItem.isExpanded,
          );
        },
      ).toList(),
    );
  }

  _dragTargetOnAccept(
      BuildContext context, String sprintId, UserStory userStory) {
    final BacklogPageStore backlogPageStore =
        Provider.of<BacklogPageStore>(context, listen: false);

    backlogPageStore.addUserStoryToSprint(sprintId, userStory);
  }
}
