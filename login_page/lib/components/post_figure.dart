import 'package:flutter/material.dart';
import 'package:login_page/styles/app_text.dart';

class PostFigure extends StatelessWidget {
  final String postNumber;
  final String posttext;
  const PostFigure(
      {super.key, required this.postNumber, required this.posttext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          postNumber,
          style: AppText.header2,
        ),
        Text(
          posttext,
        ),
      ],
    );
  }
}
