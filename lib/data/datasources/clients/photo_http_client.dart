import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:photo_project/domain/models/photo/photo.dart';
import 'package:photo_project/utils/contants.dart';

class PhotoHttpClient {
  final http.Client httpClient;

  PhotoHttpClient({required this.httpClient});

  Future<List<Photo>?> getPhotos() async {
    List<Photo>? photos;

    try {
      var url = Uri.parse(Constants.photosUrl);

      var response = await httpClient.get(
        url,
      );

      var res = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        photos = List.from(res).map((e) => Photo.fromJson(e)).toList();
      }
    } catch (e) {
      photos = null;
    }

    return photos;
  }
}
