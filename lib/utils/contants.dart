import 'package:flutter/material.dart';

class Constants {
  // Strings constants
  static String photosUrl = 'https://jsonplaceholder.typicode.com/photos';

  static String appBarTittle = 'Photos Page';

  static String errorMessage = 'Error due to:';

  static String unknownErrorMessage = 'Unknown error, please try again.';

  static String previous = 'Previous';

  static String next = 'Next';

  static String infiniteScrollListTabMessage = 'Infinite scroll list';

  static String paginatedListTabMessage = 'Paginated list';

  static String splashImage = 'assets/images/icon.png';

  static String retry = 'Re try';

  static String appName = 'Photos App';

  //style contants
  static Color cardColor = const Color(0xffF7F7F7);

  static const errorTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const cardTittleTexStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );

  static const cardSubtittleTexStyle = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );
}
