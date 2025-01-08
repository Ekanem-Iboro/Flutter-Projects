import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/components/hotel_view.dart';
import 'package:ticket_booking_app/components/ticket_view.dart';
import 'package:ticket_booking_app/utils/app_data.dart';
import 'package:ticket_booking_app/utils/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: Styles.subHeadlineStyle2,
                        ),
                        const Gap(5),
                        Text(
                          "Book Tickets",
                          style: Styles.headLineStyle,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo.png'),
                          )),
                    )
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xfff4f6fd),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color.fromARGB(255, 150, 151, 56),
                      ),
                      Text(
                        "Search",
                        style: Styles.subHeadlineStyle3,
                      )
                    ],
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
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList
                  .map((singleTickets) => TicketView(ticket: singleTickets))
                  .toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hotels",
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
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: hotelList
                  .map((singleHotel) => HotelView(hotel: singleHotel))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
