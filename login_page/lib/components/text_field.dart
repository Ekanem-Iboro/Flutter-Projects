import 'package:flutter/material.dart';
import 'package:login_page/styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String inputHintText;
  final dynamic control;
  final ValueChanged<String> onChanged;
  const CustomTextField({
    super.key,
    required this.inputHintText,
    this.control,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: inputHintText,
        labelText: inputHintText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(12),
        //   ),
        // ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: AppColors.filledColor,
      ),
    );
  }
}
