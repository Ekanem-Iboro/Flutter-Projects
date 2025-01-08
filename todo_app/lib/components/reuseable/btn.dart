import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String btnName;
  VoidCallback onPressed;
  MyBtn({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        btnName,
      ),
    );
  }
}
