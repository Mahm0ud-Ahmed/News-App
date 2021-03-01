import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/nav_drawer.dart';

class InstegramFeeds extends StatefulWidget {
  @override
  _InstegramFeedsState createState() => _InstegramFeedsState();
}

class _InstegramFeedsState extends State<InstegramFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instegram Feeds'),
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
      padding: const EdgeInsets.only(top: 16, right: 4, left: 16, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
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
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Fri, 12 May 2017 • 14.30',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey.shade400,
                  ),
                  onPressed: () {},
                ),
                Transform.translate(
                  offset: Offset(-8, 0),
                  child: Text(
                    '100',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyCard() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We also talk about the future of work as the robots',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Wrap(
                  children: [
                    Text(
                      '#advance ',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      '#retro ',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      '#instagram ',
                      style: TextStyle(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            fit: BoxFit.fill,
            image: ExactAssetImage('assets/images/im4.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _footerCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Transform.translate(
                offset: Offset(10, 0),
                child: Text(
                  '25',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'COMMENTS',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
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
      ),
    );
  }
}
