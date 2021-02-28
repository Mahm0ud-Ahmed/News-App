import 'package:flutter/material.dart';

class NavigatorDrawer extends StatelessWidget {
  List<String> title = [
    'Explore',
    'Headline News',
    'Read Later',
    'Videos',
    'Photos',
    'Setting',
    'Logout',
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
                title[position],
              ),
              onTap: () {},
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
