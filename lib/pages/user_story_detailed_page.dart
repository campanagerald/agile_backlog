import 'package:agile_backlog/entity/user_story.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserStoryDetailedPage extends StatelessWidget {
  const UserStoryDetailedPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStory = Provider.of<UserStory>(context);

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            title: Text('User Story'),
            flexibleSpace: Align(
              child: Text(
                userStory.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desription:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          userStory.description,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Assignee:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage(userStory.assignee.avatarImageUrl),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Story point estimate:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          userStory.storyPoint.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
