import 'package:agile_backlog/entity/user_story.dart';
import 'package:flutter/material.dart';

class SprintExpansionPanelDragTarget extends StatefulWidget {
  final Function(UserStory) onAccept;

  SprintExpansionPanelDragTarget({
    Key key,
    @required this.onAccept,
  }) : super(key: key);

  @override
  _SprintExpansionPanelDragTargetState createState() =>
      _SprintExpansionPanelDragTargetState();
}

class _SprintExpansionPanelDragTargetState<T>
    extends State<SprintExpansionPanelDragTarget> {
  bool willAccept = false;

  @override
  Widget build(BuildContext context) {
    return DragTarget<UserStory>(
      onWillAccept: (_) {
        setState(() {
          willAccept = true;
        });

        return true;
      },
      onLeave: (object) {
        setState(() {
          willAccept = false;
        });
      },
      onAccept: widget.onAccept,
      builder: (_, incoming, rejected) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: willAccept ? 10 : 2,
              color: Colors.black45,
            ),
          ),
          child: Center(
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
