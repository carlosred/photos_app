import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_project/utils/contants.dart';

import '../controllers/photos_controller.dart';

class ErrorPhotoWidget extends ConsumerWidget {
  const ErrorPhotoWidget({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            message,
            style: Constants.errorTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(photosControllerProvider.notifier).getPhotoList();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Re try',
              style: Constants.cardTittleTexStyle,
            ),
          ),
        ],
      ),
    );
  }
}
