import 'package:photo_project/data/datasources/clients/photo_http_client.dart';

import '../../domain/models/photo/photo.dart';

class PhotoRepository {
  final PhotoHttpClient photoHttpClient;

  PhotoRepository({required this.photoHttpClient});

  Future<List<Photo>?> getPhotos() async {
    List<Photo>? photos;

    try {
      photos = await photoHttpClient.getPhotos();
    } catch (e) {
      photos = null;
    }
    return photos;
  }
}
