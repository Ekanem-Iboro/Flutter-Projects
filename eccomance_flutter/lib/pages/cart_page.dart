import 'package:eccomance_flutter/components/cart_items.dart';
import 'package:eccomance_flutter/models/cart.dart';
import 'package:eccomance_flutter/models/shoe_models.dart';
import 'package:eccomance_flutter/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenSizeHelper.height(context);
    final screenWidth = ScreenSizeHelper.width(context);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Consumer<CartModal>(
          builder: (context, value, child) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.grey[600],
                    size: 30,
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  const Text(
                    'My Cart',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: value.getCartItems().length,
                    itemBuilder: (context, index) {
                      ShoeModels cartShoe = value.getCartItems()[index];

                      return CartItems(
                        shoe: cartShoe,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
