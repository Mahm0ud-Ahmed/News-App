import 'dart:math';

import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Color> _listColors = [
    Colors.black,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.lime,
    Colors.purple,
    Colors.teal,
    Colors.red,
    Colors.blue,
    Colors.amber,
  ];

  List<String> _listCategory = [
    'Lifestyle',
    'Sport',
    'Business',
    'Techno',
    'Health',
  ];

  List<String> _imgPath = [
    'assets/images/im4.jpg',
    'assets/images/im5.jpg',
    'assets/images/im6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          margin: EdgeInsets.all(8),
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                _userInfo(
                  _getColorRandom(),
                  _getCategoryName(),
                ),
                _topStoriesItem(
                  _getImgPath(),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _userInfo(Color color, String categoryName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 16),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michael Adams',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      '15 Min . ',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      categoryName,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.bookmark_border,
            color: Colors.grey.shade700,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _topStoriesItem(String imgPath) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image(
                image: ExactAssetImage(imgPath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'The World Global Warming Annual Summit',
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'We also talk about the future of work as the robots advance, and we ask whether a retro phone',
                    maxLines: 4,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _getColorRandom() {
    Random _random = Random();
    return _listColors[_random.nextInt(_listColors.length)];
  }

  String _getCategoryName() {
    Random _random = Random();
    return _listCategory[_random.nextInt(_listCategory.length)];
  }

  String _getImgPath() {
    Random _random = Random();
    return _imgPath[_random.nextInt(_imgPath.length)];
  }
}
