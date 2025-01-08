import 'package:flutter/material.dart';

class MyProducts extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color background;
  //
  const MyProducts(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$price',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Image.asset(
              image,
              height: 175,
              width: 220,
            ),
          )
          // Image(
          //   height: 175,
          //   image: AssetImage(
          //     image,
          //   ),
          // )
        ],
      ),
    );
  }
}
