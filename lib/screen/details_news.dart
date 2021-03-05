import 'package:flutter/material.dart';
import 'package:flutter_app/model/news_api_model.dart';

class DetailsNews extends StatefulWidget {
  NewsTopHeadlinesModel _newsModel;

  DetailsNews(this._newsModel);

  @override
  _DetailsNewsState createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Details News'),
            pinned: true,
            floating: true,
            snap: true,
            backgroundColor: Colors.red.shade800,
            expandedHeight: MediaQuery.of(context).size.height * 0.30,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(widget._newsModel.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: _drawDetailsNews(widget._newsModel),
                  margin: EdgeInsets.all(16),
                ),
              ],
            ),
            itemExtent: MediaQuery.of(context).size.height * 0.30,
          )
        ],
      ),
    );
  }

  Widget _drawDetailsNews(NewsTopHeadlinesModel model) {
    return Text(
      model.description,
      style: TextStyle(
        fontSize: 14,
      ),
    );
  }
}
