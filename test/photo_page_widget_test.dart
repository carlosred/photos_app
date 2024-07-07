import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:photo_project/data/datasources/clients/photo_http_client.dart';
import 'package:photo_project/data/providers/data_providers.dart';
import 'package:photo_project/data/repositories/photo_repository.dart';
import 'package:photo_project/main.dart';

import 'package:photo_project/utils/contants.dart';

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
  },{
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "natus nisi omnis corporis facere molestiae rerum in",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "accusamus ea aliquid et amet sequi nemo",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2"
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "officia delectus consequatur vero aut veniam explicabo molestias",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  }, {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  }
      ]''';

class PhotoRepositoryMock extends Mock implements PhotoRepository {}

class HttpClientMock extends Mock implements http.Client {}

void main() {
  final httpClientMock = HttpClientMock();
  final photoRepositoryMock = PhotoRepository(
    photoHttpClient: PhotoHttpClient(httpClient: httpClientMock),
  );

  group('Photo Page widget test', () {
    testWidgets(
        'when the app runs runs should run the splash page first and then make the api request to the photos endpoint and show the 2 tabs with the infinite scroll list and the paginated list',
        (WidgetTester tester) async {
      when(
        () => httpClientMock.get(Uri.parse(Constants.photosUrl)),
      ).thenAnswer(
          (invocation) async => http.Response(getPhotoListResponse, 200));

      await tester.pumpWidget(
        ProviderScope(overrides: [
          photoRepositoryProvider.overrideWithValue(
            photoRepositoryMock,
          )
        ], child: const MyApp()),
      );
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      var appbarTittle = find.text(Constants.appBarTittle);
      var tabInfiniteScrollText =
          find.text(Constants.infiniteScrollListTabMessage);
      var tabPaginatedListText = find.text(Constants.paginatedListTabMessage);

      expect(appbarTittle, findsOneWidget);
      expect(tabInfiniteScrollText, findsOneWidget);
      expect(tabPaginatedListText, findsOneWidget);
    });
  });
}
