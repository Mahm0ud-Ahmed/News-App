import 'package:flutter_app/model/jsonplaceholder_post_model.dart';
import 'package:flutter_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class DataPostJsonPlaceHolder {
  final String _path = base_url_jsonPlaceHolder_api + postCategory;

  Future<List<PostJsonPLaceHolderModel>> fetchAllData() async {
    List<PostJsonPLaceHolderModel> _data = [];
    var response = await http.get(_path);
    if (response.statusCode == 200) {
      PostJsonPLaceHolderModel postModel;
      var jsonDecode = json.jsonDecode(response.body);
      for (var obj in jsonDecode) {
        postModel = PostJsonPLaceHolderModel(
          id: obj['id'].toString(),
          userId: obj['userId'].toString(),
          title: obj['title'].toString(),
          body: obj['body'].toString(),
        );
        _data.add(postModel);
      }
    }
    return _data;
  }
}
