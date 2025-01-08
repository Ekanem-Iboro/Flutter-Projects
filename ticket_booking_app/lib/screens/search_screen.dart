import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/components/reuseable/text_icon.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/widgets/ticket_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text(
            'What Are \n You Looking For?',
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
              firstTab: 'Airline Ticket',
              secondTab: 'Hotels',
            ),
          ),
          //
          const Gap(20),
          const Texticon(icon: Icons.flight_takeoff_rounded, text: 'Depature'),
          //
          const Gap(20),
          const Texticon(icon: Icons.flight_land_rounded, text: 'Arrival'),

          const Gap(20),

          Container(
            padding: const EdgeInsetsDirectional.symmetric(
                vertical: 14, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xd91130ce),
            ),
            child: Center(
              child: Text(
                'Find Tickets',
                style: Styles.titleStyle.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Upcoming Flight",
                style: Styles.subHeadlineStyle,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "View all",
                  style: Styles.titleStyle.copyWith(
                    color: Styles.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          //
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.44,
                constraints: BoxConstraints(
                    minHeight: size.height * 0.26 // Minimum height of 26%
                    ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 5,
                      ),
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/plane_sit.jpg'),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Text(
                      "20% discount onearly booking of the flight tickets, Don't miss this chance.",
                      style: Styles.titleStyle.copyWith(
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width * 0.44,
                        height: size.height * 0.20,
                        // constraints: BoxConstraints(
                        //     minHeight:
                        //         size.height * 0.26 // Minimum height of 26%
                        //     ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color(0xff3abbbb)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discount \nFor Survey',
                              style: Styles.headLineStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Gap(10),
                            Text(
                              'Take the survey about our servies and get discount',
                              style: Styles.subHeadlineStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 18,
                                color: const Color(0xff189999),
                              ),
                              color: Colors.transparent),
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.20,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xffec6545),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Take love',
                          style: Styles.subHeadlineStyle.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const Gap(5),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "🥰",
                                style: TextStyle(
                                  fontSize: 38,
                                ),
                              ),
                              TextSpan(
                                text: "😍",
                                style: TextStyle(fontSize: 50),
                              ),
                              TextSpan(
                                text: "😘",
                                style: TextStyle(fontSize: 30),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
