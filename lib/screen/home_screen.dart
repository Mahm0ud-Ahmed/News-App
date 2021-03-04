import 'package:flutter/material.dart';
import 'package:flutter_app/api/data_post_jsonplaceholder.dart';
import 'package:flutter_app/screen/about.dart';
import 'package:flutter_app/screen/contact.dart';
import 'package:flutter_app/screen/help.dart';
import 'package:flutter_app/screen/setting.dart';
import 'package:flutter_app/screen/tabs/favourite.dart';
import 'package:flutter_app/screen/tabs/popular.dart';
import 'package:flutter_app/utilities/nav_drawer.dart';
import 'tabs/whats_new.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopupMenuList { About, Contact, Help, Setting }

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
          _buildPopupMenu(),
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

  Widget _buildPopupMenu() {
    return PopupMenuButton<PopupMenuList>(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<PopupMenuList>>[
          const PopupMenuItem<PopupMenuList>(
            value: PopupMenuList.Setting,
            child: Text('Setting'),
          ),
          const PopupMenuItem<PopupMenuList>(
            value: PopupMenuList.Contact,
            child: Text('Contact'),
          ),
          const PopupMenuItem<PopupMenuList>(
            value: PopupMenuList.Help,
            child: Text('Help'),
          ),
          const PopupMenuItem<PopupMenuList>(
            value: PopupMenuList.About,
            child: Text('About'),
          ),
        ];
      },
      onSelected: (PopupMenuList menu) {
        switch (menu) {
          case PopupMenuList.About:
            return _navPage(
              context,
              About(),
            );
          case PopupMenuList.Contact:
            return _navPage(
              context,
              Contact(),
            );
          case PopupMenuList.Help:
            return _navPage(
              context,
              Help(),
            );
          case PopupMenuList.Setting:
            return _navPage(
              context,
              Setting(),
            );
        }
      },
    );
  }

  Widget _navPage(BuildContext context, dynamic obj) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return obj;
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
