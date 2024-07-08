import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_project/utils/contants.dart';
import 'core/navigation/routes.dart';
import 'core/navigation/routes_generator.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: ThemeData(
        primaryColor: Constants.cardColor,
        cardColor: Constants.cardColor,
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
        ),
      ),
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
