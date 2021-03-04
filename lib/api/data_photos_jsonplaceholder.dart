import 'package:flutter_app/model/jsonplaceholder_photos_model.dart';
import 'package:flutter_app/utilities/api_utilities.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class DataPhotosJsonPlaceHolder {
  final String _path = base_url_jsonPlaceHolder_api + photosCategory;

  Future<List<PhotosJsonPLaceHolderModel>> fetchAllData() async {
    List<PhotosJsonPLaceHolderModel> photosData = [];
    var response = await http.get(_path);
    if (response.statusCode == 200) {
      PhotosJsonPLaceHolderModel photosModel;
      var jsonDecode = json.jsonDecode(response.body);
      for (var obj in jsonDecode) {
        photosModel = PhotosJsonPLaceHolderModel(
          id: obj['id'].toString(),
          albumId: obj['albumId'].toString(),
          title: obj['title'].toString(),
          url: obj['url'].toString(),
          thumbnailUrl: obj['thumbnailUrl'].toString(),
        );
        photosData.add(photosModel);
      }
    }
    return photosData;
  }
}
