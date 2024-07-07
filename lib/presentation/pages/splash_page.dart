// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_project/presentation/controllers/photos_controller.dart';
import 'package:animate_do/animate_do.dart';
import '../../core/navigation/routes.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(photosControllerProvider.notifier).getPhotoList();

      await Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      Navigator.of(context).pushReplacementNamed(
        Routes.photoRoute,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Center(
                child: Pulse(
                  infinite: true,
                  child: FractionallySizedBox(
                    widthFactor: 0.15,
                    heightFactor: 0.15,
                    child: Image.asset('assets/images/icon.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
