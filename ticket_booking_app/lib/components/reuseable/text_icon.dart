import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class Texticon extends StatelessWidget {
  final IconData icon;
  final String text;
  const Texticon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, size: 23),
          const SizedBox(width: 8),
          Text(
            text,
            style: Styles.titleStyle,
          ),
        ],
      ),
    );
  }
}
