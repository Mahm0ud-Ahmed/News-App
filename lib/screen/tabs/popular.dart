import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/api/data_news_api.dart';
import 'package:flutter_app/model/news_api_model.dart';
import 'package:flutter_app/utilities/extenion.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

List<String> imgPath = [
  'assets/images/im4.jpg',
  'assets/images/im5.jpg',
  'assets/images/im6.jpg',
];

class _PopularState extends State<Popular> {
  DataNewsApi newsApi = DataNewsApi();
  int length = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newsApi.fetchAllDataTopStories(country: 'us'),
// ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return connectionError();
          case ConnectionState.waiting:
            return loading();
          case ConnectionState.active:
            return loading();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return errorInData(snapshot.error);
            } else {
              if (snapshot.hasData) {
                List<NewsTopHeadlinesModel> dataModel = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, position) {
                    return Card(
                      child: _topStoriesItem(dataModel[position]),
                    );
                  },
                  itemCount: dataModel.length,
                );
              } else {
                return noData();
              }
            }
        }
      },
    );
  }

  Widget _topStoriesItem(NewsTopHeadlinesModel model) {
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
                image: NetworkImage(model.urlToImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
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
                        model.author,
                        style: TextStyle(
                          fontSize: 12,
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

  /*
  Random _random = Random();
  String _returnRandom() {
    return imgPath[_random.nextInt(imgPath.length)];
  }
   */
}
