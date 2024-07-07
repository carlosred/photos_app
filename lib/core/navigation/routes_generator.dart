import 'package:flutter/material.dart';
import 'package:photo_project/presentation/pages/photos_page.dart';
import 'package:photo_project/presentation/pages/splash_page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case Routes.photoRoute:
        return MaterialPageRoute(
          builder: (context) => const PhotoPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
    }
  }
}
