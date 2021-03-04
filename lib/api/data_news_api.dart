import 'package:flutter_app/model/news_api_model.dart';
import 'package:flutter_app/model/news_sources_model.dart';
import 'package:flutter_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class DataNewsApi {
  Future<List<NewsTopHeadlinesModel>> fetchAllDataTopStories(
      {String country}) async {
    final String path =
        base_url_news_api + top_headlines + countryName + country + api_key;
    var response = await http.get(path);
    List<NewsTopHeadlinesModel> list = <NewsTopHeadlinesModel>[];
    if (response.statusCode == 200) {
      var jsonDecode = json.jsonDecode(response.body);
      var articles = jsonDecode["articles"];
      NewsTopHeadlinesModel newsModel;
      for (var obj in articles) {
        newsModel = NewsTopHeadlinesModel(
          author: obj['author'].toString(),
          title: obj['title'].toString(),
          description: obj['description'].toString(),
          url: obj['url'].toString(),
          urlToImage: obj['urlToImage'].toString(),
          publishedAt: obj['publishedAt'].toString(),
        );
        list.add(newsModel);
      }
    }
    return list;
  }

  Future<List<NewsSourcesModel>> fetchAllDataSources() async {
    final String path = base_url_news_api + sources + api_key;
    var response = await http.get(path);
    List<NewsSourcesModel> list = <NewsSourcesModel>[];
    if (response.statusCode == 200) {
      var jsonDecode = json.jsonDecode(response.body);
      var articles = jsonDecode["sources"];
      NewsSourcesModel sourcesModel;
      for (var obj in articles) {
        sourcesModel = NewsSourcesModel(
          name: obj['name'].toString(),
          description: obj['description'].toString(),
          category: obj['category'].toString(),
          country: obj['country'].toString(),
        );
        list.add(sourcesModel);
      }
    }
    return list;
  }
}
