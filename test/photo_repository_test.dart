import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:photo_project/data/datasources/clients/photo_http_client.dart';
import 'package:photo_project/data/repositories/photo_repository.dart';
import 'package:photo_project/utils/contants.dart';

class PhotoRepositoryMock extends Mock implements PhotoRepository {}

class HttpClientMock extends Mock implements http.Client {}

void main() {
  final httpClientMock = HttpClientMock();
  final photoRepository = PhotoRepository(
    photoHttpClient: PhotoHttpClient(httpClient: httpClientMock),
  );

  group('photoRepository tests', () {
    test('photoRepository get method test should return a list of photos',
        () async {
      var getPhotoListResponse = '''[
        {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  }
      ]''';

      when(
        () => httpClientMock.get(Uri.parse(Constants.photosUrl)),
      ).thenAnswer(
          (invocation) async => http.Response(getPhotoListResponse, 200));

      final result = await photoRepository.getPhotos();

      expect(result!.length, 2);
    });
  });
}
