import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_project/presentation/controllers/photos_controller.dart';
import 'package:photo_project/presentation/providers/presentation_providers.dart';
import 'package:photo_project/presentation/widgets/photo_list_pagination_widget.dart';
import 'package:photo_project/utils/contants.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/photo_list_widget.dart';

class PhotoPage extends ConsumerStatefulWidget {
  const PhotoPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PhotoPageState();
}

class _PhotoPageState extends ConsumerState<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    var photosController = ref.watch(photosControllerProvider);
    var tabIndex = ref.watch(tabIndexProvider);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: PhotoAppBar(title: Constants.appBarTittle),
      ),
      body: Container(
        height: height,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: width,
        child: photosController.when(
          data: (data) {
            if (data != null) {
              return IndexedStack(
                index: tabIndex,
                children: [
                  PhotoInfiniteList(
                    fullListPhotos: data,
                  ),
                  PhotoListPagination(
                    fullListPhotos: data,
                  ),
                ],
              );
            } else {
              return ErrorPhotoWidget(
                message: Constants.unknownErrorMessage,
              );
            }
          },
          error: (error, stackTrace) => ErrorPhotoWidget(
            message: '${Constants.errorMessage} $error',
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
