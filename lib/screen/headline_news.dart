import 'package:flutter/material.dart';
import 'package:flutter_app/screen/tabs/favourite.dart';
import 'package:flutter_app/screen/tabs/popular.dart';
import 'package:flutter_app/utilities/nav_drawer.dart';

class HeadlineNews extends StatefulWidget {
  @override
  _HeadlineNewsState createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Headline News',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'WHAT\'S NEW',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'FAVOURITE',
            ),
          ],
        ),
      ),
      drawer: NavigatorDrawer(),
      body: TabBarView(
        children: [
          Favourite(),
          Popular(),
          Favourite(),
        ],
        controller: _controller,
      ),
    );
  }
}
