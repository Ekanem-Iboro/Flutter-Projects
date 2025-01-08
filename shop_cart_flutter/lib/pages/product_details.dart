import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_cart_flutter/components/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSizes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.product['imageUrl'] as String,
              height: 250,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(224, 247, 249, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          ((widget.product['sizes'] as List<int>)[index]);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizes = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                              style: TextStyle(
                                color: selectedSizes == size
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            backgroundColor: selectedSizes == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (selectedSizes != 0) {
                        // Provider.of<CartProvider>(context, listen: false)
                        context.read<CartProvider>().addProduct(
                          {
                            'id': widget.product['id'],
                            'title': widget.product['title'],
                            'companyName': widget.product['companyName'],
                            'price': widget.product['price'],
                            'size': selectedSizes,
                            'imageUrl': widget.product['imageUrl']
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added successfully'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a size'),
                          ),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black, // Optional: To match the text color
                    ),
                    label: const Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(
                        370,
                        50,
                      ),
                      // minimumSize: const Size(
                      //   double.infinity,
                      //   50,
                      // ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
