import 'package:flutter/material.dart';
import 'package:login_page/styles/app_colors.dart';

class BtnUseSigninwith extends StatelessWidget {
  final String img;
  final String txt;

  const BtnUseSigninwith({super.key, required this.img, required this.txt});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      onPressed: () => {},
      child: SizedBox(
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              width: 22,
              height: 22,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(txt)
          ],
        ),
      ),
    );
  }
}
