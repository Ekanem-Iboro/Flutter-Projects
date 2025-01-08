import 'package:flutter/material.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class TicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const TicketTabs(
      {super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return FittedBox(
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(50),
              //     bottomLeft: Radius.circular(50)),
              color: Colors.white,
            ),
            width: size.width * 0.50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                firstTab,
                style: Styles.titleStyle,
              ),
            ),
          ),
          //
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            width: size.width * 0.50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(
                // 'Hotels',
                secondTab,
                style: Styles.titleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
