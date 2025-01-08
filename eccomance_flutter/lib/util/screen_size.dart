import 'package:flutter/material.dart';

class ScreenSizeHelper {
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double percentageHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }

  static double percentageWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }
}

// import 'package:flutter/material.dart';

// extension ScreenSizeExtensions on BuildContext {
//   double get screenHeight => MediaQuery.of(this).size.height;
//   double get screenWidth => MediaQuery.of(this).size.width;

//   double heightPercentage(double percentage) => MediaQuery.of(this).size.height * percentage;
//   double widthPercentage(double percentage) => MediaQuery.of(this).size.width * percentage;
// }
