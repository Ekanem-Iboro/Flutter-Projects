import 'package:flutter/material.dart';

class AppbarComp extends StatelessWidget {
  // final IconData? icon1;
  // final IconData? icon2;
  final String? title;

  const AppbarComp({super.key, this.title});

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title!),
      centerTitle: true,
      foregroundColor: Colors.white,
      // leading: Icon(icon1),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(icon2),
      //   ),
      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }
}
