import 'package:eccomance_flutter/components/shoe.dart';
import 'package:eccomance_flutter/models/cart.dart';
import 'package:eccomance_flutter/models/shoe_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to cart
  void addShoeToCart(ShoeModels shoe) {
    bool isAdded =
        Provider.of<CartModal>(context, listen: false).addToCart(shoe);

    // Show appropriate alert dialog
    String title = isAdded ? 'Shoe Added to Cart' : 'Item Already in Cart';
    String message = isAdded
        ? 'You added ${shoe.name} to your cart.'
        : '${shoe.name} is already in your cart.';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModal>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
        child: Column(children: [
          TextField(
            style: const TextStyle(
              color: Colors.grey, // User input text color
            ),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              filled: true, // Enables the background color
              fillColor:
                  Colors.grey[100], // Set the background color to light grey

              //  border: InputBorder.none, remmoves the border
              // focusedBorder: InputBorder.none, smae here
              labelText: 'Search',
              labelStyle: const TextStyle(
                color: Colors.grey, // Change label text color to grey
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300, // Initial border color
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300, // Border color when focused
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300, // Border color when not focused
                  width: 2.0,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'everyone flies, but some fly higher than the other',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(
            height: 70.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          //list of products
          Expanded(
            child: ListView.builder(
              itemCount: value.getSheoesForSale().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ShoeModels sheo = value.getSheoesForSale()[index];
                return ShoeTile(
                  shoe: sheo,
                  onTap: () => addShoeToCart(sheo),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Divider(
                // color: Colors.white,
                ),
          ),
        ]),
      ),
    );
  }
}
