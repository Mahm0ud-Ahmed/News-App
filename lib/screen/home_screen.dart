import 'package:flutter/material.dart';
import 'package:flutter_app/tabs/favourite.dart';
import 'package:flutter_app/tabs/popular.dart';
import 'package:flutter_app/tabs/whats_new.dart';
import 'package:flutter_app/utilities/nav_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
          'Explore',
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
          WhatsNew(),
          Popular(),
          Favourite(),
        ],
        controller: _controller,
      ),
    );
  }
}
