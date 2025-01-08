import "package:flutter/material.dart";

Color primary = const Color(0xff687daf);

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xff3b3b3b);
  static Color bgColor = const Color(0xffeeedf2);
  static Color orangeColor = const Color(0xFFFFA500);
  static Color kaki = const Color(0xFFd2bdd6);
  static Color ticketOrangeColor = const Color(0xFFF37b67);
  static TextStyle titleStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: textColor,
  );
  static TextStyle headLineStyle = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
  static TextStyle subHeadlineStyle = TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static TextStyle subHeadlineStyle2 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade500,
  );
  static TextStyle subHeadlineStyle3 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade500,
  );
}
