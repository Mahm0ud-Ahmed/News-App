import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/nav_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigatorDrawer(),
      body: ListView.builder(
        itemBuilder: (context, position) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerCard(),
                _bodyCard(),
                _borderLine(),
                _footerCard(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _headerCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage: ExactAssetImage(
                'assets/images/im5.jpg',
              ),
              radius: 24,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Christina Meyers ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@ch_meyers',
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text('Fri, 12 May 2017 • 14.30'),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyCard() {
    return Container(
      padding: const EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 16),
      child: Text(
        'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _footerCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.repeat,
                color: Colors.orange,
                size: 24,
              ),
              onPressed: () {},
            ),
            Text(
              '25',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ],
        ),
        Row(
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                'SHARE',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'OPEN',
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _borderLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }
}
