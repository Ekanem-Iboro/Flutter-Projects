import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/components/ticket_view.dart';
import 'package:ticket_booking_app/utils/app_data.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/widgets/ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            children: [
              const Gap(40),
              Text(
                'Tickets',
                style: Styles.titleStyle.copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xfff4f6fd),
                ),
                child: const TicketTabs(
                  firstTab: 'Upxoming',
                  secondTab: 'Previews',
                ),
              ),
              const Gap(20),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Flutter DB',
                                style: Styles.subHeadlineStyle2,
                              ),
                              const Gap(10),
                              // const SizedBox(height: 10),
                              Text(
                                'Passanger',
                                style: Styles.subHeadlineStyle2,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
