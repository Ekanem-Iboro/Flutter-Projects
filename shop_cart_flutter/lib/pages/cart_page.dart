import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_flutter/components/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart Page'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItems = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                cartItems['imageUrl'] as String,
              ),
            ),
            title: Text(
              cartItems['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Size: ${cartItems['size']}',
                  ),
                ),
                Text(
                  '\$${cartItems['price']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                          'Are you sure you wan tot remove this product from the cart?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .removeProduct(cartItems);
                            // Provider.of<CartProvider>(context, listen: false)
                            //     .removeProduct(cartItems);
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
              focusColor: Colors.redAccent,
            ),
          );
        },
      ),
    );
  }
}
