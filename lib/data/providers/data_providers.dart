import 'package:photo_project/data/datasources/clients/photo_http_client.dart';
import 'package:photo_project/data/repositories/photo_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;

var photoRepositoryProvider = Provider<PhotoRepository>(
  (ref) => PhotoRepository(
    photoHttpClient: PhotoHttpClient(
      httpClient: http.Client(),
    ),
  ),
);
