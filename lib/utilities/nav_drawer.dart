import 'package:flutter/material.dart';
import 'package:flutter_app/modle/nav_model.dart';
import 'package:flutter_app/screen/headline_news.dart';
import 'package:flutter_app/screen/home_screen.dart';
import 'package:flutter_app/screen/instegram_feeds.dart';
import 'package:flutter_app/screen/twitter_feeds.dart';

class NavigatorDrawer extends StatelessWidget {
  List<NavDrawerModel> title = [
    NavDrawerModel(
      title: 'Explore',
      getObj: () => HomeScreen(),
    ),
    NavDrawerModel(
      title: 'Headline News',
      getObj: () => HeadlineNews(),
    ),
    NavDrawerModel(
      title: 'Twitter',
      getObj: () => TwitterFeeds(),
    ),
    NavDrawerModel(
      title: 'Instegram Feeds',
      getObj: () => InstegramFeeds(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, left: 16, right: 8),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                title[position].title,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return title[position].getObj();
                  }),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Colors.grey.shade400,
              ),
            );
          },
          itemCount: title.length,
        ),
      ),
    );
  }
}
