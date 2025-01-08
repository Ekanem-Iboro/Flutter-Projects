import 'package:eccomance_flutter/models/shoe_models.dart';
import 'package:eccomance_flutter/util/screen_size.dart';
import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  ShoeModels shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSizeHelper.height(context);
    final screenWidth = ScreenSizeHelper.width(context);
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 25),
      width: screenWidth * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(shoe.imagePath)),
          // Text(
          //   shoe.name,
          //   style: const TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.grey,
          //   ),
          // ),
          SizedBox(height: screenHeight * 0.015),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              shoe.desc,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    shoe.price,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => onTap?.call(),
                //or
                // onTap: onTap,

                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child:
                        const Icon(Icons.add, size: 24, color: Colors.white)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
