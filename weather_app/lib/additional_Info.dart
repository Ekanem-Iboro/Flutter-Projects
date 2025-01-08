import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const AdditionalInfo(
      {super.key, required this.icon, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white60,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
