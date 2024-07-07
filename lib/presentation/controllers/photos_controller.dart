import 'package:photo_project/data/providers/data_providers.dart';
import 'package:photo_project/domain/models/photo/photo.dart';
import 'package:photo_project/presentation/providers/presentation_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photos_controller.g.dart';

@Riverpod(keepAlive: true)
class PhotosController extends _$PhotosController {
  @override
  Future<List<Photo>?> build() async {
    return null;
  }

  Future<void> getPhotoList() async {
    state = const AsyncLoading();
    try {
      var photoList = await ref.read(photoRepositoryProvider).getPhotos();
      ref.read(photoListProvider.notifier).state = photoList;
      state = AsyncData(photoList);
    } catch (error, stack) {
      state = AsyncError(error, stack);
    }
  }
}
