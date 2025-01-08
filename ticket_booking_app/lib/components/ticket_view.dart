import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticket_booking_app/utils/app_layout.dart';
import 'package:ticket_booking_app/utils/styles.dart';
import 'package:ticket_booking_app/widgets/round_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    // debugPrint(AppLayout.getHeight(200).toString());

    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: size.height * 0.24,
      // height: AppLayout.getHeight(200),
      // width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //showing the blue part of the card-ticket
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: isColor == null ? const Color(0xff526799) : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null
                            ? Styles.subHeadlineStyle2
                                .copyWith(color: Colors.white)
                            : Styles.subHeadlineStyle2,
                      ),
                      const Spacer(),
                      const RoundContainer(isColor: true),
                      Expanded(
                        //overlap the icon and the dash- by using stack widget
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                //dynamically get the screen width so the dash -- can fit for all screens
                                builder: (context, constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: isColor == null
                                                ? Colors.white
                                                : Colors.grey.shade300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            //rotate the plane icon
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const RoundContainer(isColor: true),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style: isColor == null
                            ? Styles.subHeadlineStyle2
                                .copyWith(color: Colors.white)
                            : Styles.subHeadlineStyle2
                                .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['from']['name'],
                          style: isColor == null
                              ? Styles.subHeadlineStyle3
                                  .copyWith(color: Colors.white)
                              : Styles.subHeadlineStyle2,
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: isColor == null
                            ? Styles.subHeadlineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.subHeadlineStyle3
                                .copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: isColor == null
                              ? Styles.subHeadlineStyle3
                                  .copyWith(color: Colors.white)
                              : Styles.subHeadlineStyle3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //
            //showing the orange part of the card-ticket
            Container(
              color: isColor == null ? Styles.ticketOrangeColor : Colors.white,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                    ),
                  ),
                  //
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => SizedBox(
                              width: 5,
                              height: 1,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                color: isColor == null
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              )),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  //
                  //
                  const SizedBox(
                    width: 10,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //showing the button part of the oprange color
            Container(
              height: 100,
              decoration: BoxDecoration(
                color:
                    isColor == null ? Styles.ticketOrangeColor : Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['date'],
                            style: isColor == null
                                ? Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Date",
                            style: isColor == null
                                ? Styles.subHeadlineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle3,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: isColor == null
                                ? Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Depature Time",
                            style: isColor == null
                                ? Styles.subHeadlineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle3,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${ticket['number']}",
                            style: isColor == null
                                ? Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle2
                                    .copyWith(color: Colors.black),
                          ),
                          const Gap(5),
                          Text(
                            "Number",
                            style: isColor == null
                                ? Styles.subHeadlineStyle3
                                    .copyWith(color: Colors.white)
                                : Styles.subHeadlineStyle3,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
