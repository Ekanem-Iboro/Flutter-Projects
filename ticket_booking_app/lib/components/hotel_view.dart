import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class HotelView extends StatelessWidget {
  final Map<String, dynamic> hotel;
//
  const HotelView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      width: size.width * 0.5,
      constraints:
          BoxConstraints(minHeight: size.height * 0.26 // Minimum height of 26%
              ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${hotel['image']}'),
              ),
            ),
          ),
          const Gap(10),
          Text(
            '${hotel['place']}',
            style: Styles.subHeadlineStyle.copyWith(
              color: Styles.kaki,
            ),
          ),
          const Gap(10),
          Text(
            '${hotel['destination']}',
            style: Styles.subHeadlineStyle2.copyWith(
              color: Colors.white,
            ),
          ),
          const Gap(10),
          Text(
            '\$${hotel['price']} Per Night ',
            style: Styles.headLineStyle.copyWith(
              color: Styles.kaki,
            ),
          ),
        ],
      ),
    );
  }
}
