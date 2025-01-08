import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:eccomance_flutter/models/cart.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  int indselected;

  BottomNavBar(
      {super.key, required this.onTabChange, required this.indselected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        gap: 8.0,
        onTabChange: (value) => onTabChange!(value),
        selectedIndex: indselected,
        tabs: [
          const GButton(icon: Icons.home, text: 'Home'),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Shop',
            leading: Consumer<CartModal>(
              builder: (context, cart, child) {
                return Badge(
                  isLabelVisible: cart.getCartItems().isNotEmpty,
                  label: Text(
                    '${cart.getCartItems().length}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.shopping_bag_rounded),
                );
              },
            ),
            // leading: Stack(
            //   clipBehavior: Clip.none,
            //   children: [
            //     Icon(
            //       Icons.shopping_bag_rounded,
            //       size: 24,
            //       color: Colors.grey[400],
            //     ),
            //     Positioned(
            //       right: -4,
            //       top: -4,
            //       child: Consumer<CartModal>(
            //         builder: (context, cart, child) {
            //           return cart.getCartItems().isNotEmpty
            //               ? Container(
            //                   padding: const EdgeInsets.all(5),
            //                   decoration: BoxDecoration(
            //                     color: Colors.red,
            //                     shape: BoxShape.circle,
            //                   ),
            //                   child: Text(
            //                     '${cart.getCartItems().length}',
            //                     style: const TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 12,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 )
            //               : const SizedBox();
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
