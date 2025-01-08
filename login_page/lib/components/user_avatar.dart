import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String img;
  final double size;

  // final double width;
  // final double height;
  const UserAvatar({super.key, required this.img, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Image.network(
        img,
        width: size,
        height: size,
      ),
    );
  }
}
