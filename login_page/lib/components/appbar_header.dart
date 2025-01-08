import 'package:flutter/material.dart';
import 'package:login_page/styles/app_colors.dart';
import 'package:login_page/styles/app_text.dart';

class AppbarHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const AppbarHeader({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(
                  0, 3), // Adjust the offset to control shadow direction
            ),
          ],
        ),
        child: AppBar(
          backgroundColor:
              Colors.transparent, // Make AppBar background transparent
          foregroundColor: Colors.white,
          elevation: 0, // Remove default elevation
          title: Text(
            title,
            style: AppText.header1,
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
