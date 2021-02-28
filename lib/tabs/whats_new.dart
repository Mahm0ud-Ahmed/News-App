import 'package:flutter/material.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildTopStories(),
            _buildRecentUpdate(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 64, right: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How Terriers & Royals Gatecrashed Final',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 8,
          ),
          child: Text(
            'Top Stories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Column(
            children: [
              _topStoriesItem('assets/images/im4.jpg'),
              _buildDivider(),
              _topStoriesItem('assets/images/im5.jpg'),
              _buildDivider(),
              _topStoriesItem('assets/images/im6.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _topStoriesItem(String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.11,
              child: Image(
                image: ExactAssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The World Global Warming Annual Summit',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Michael Adams',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.grey,
                            size: 14,
                          ),
                          Text(
                            '15 min',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1.5,
      color: Colors.grey.shade100,
    );
  }

  Widget _buildRecentUpdate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          child: Text(
            'Recent Updates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        _recentUpdateItem(
          imgPath: 'assets/images/im7.jpg',
          color: Colors.deepOrange.shade700,
          textHeader: 'SPORT',
          textBody: 'Vettel is Ferrari Number One - Hamilton',
        ),
        _recentUpdateItem(
          imgPath: 'assets/images/im8.jpg',
          color: Colors.lime.shade700,
          textHeader: 'LIFESTYLE',
          textBody: 'The City in Pakistan that Loves a British Hairstyles',
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _recentUpdateItem(
      {String imgPath, Color color, String textHeader, String textBody}) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Image(
              image: ExactAssetImage(
                imgPath,
              ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 8),
            width: 75,
            height: 15,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              textHeader,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4),
            child: Text(
              textBody,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 8),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 14,
                ),
                Text(
                  '15 min',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
