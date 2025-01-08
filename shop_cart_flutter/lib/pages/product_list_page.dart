import 'package:flutter/material.dart';
import 'package:shop_cart_flutter/components/products_card.dart';
import 'package:shop_cart_flutter/global_variables.dart';
import 'package:shop_cart_flutter/pages/product_details.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<String> filters = [
    'All',
    'Adidas',
    'Nike',
    'Bada',
  ]; //

  late String selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    //
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
//

    return SafeArea(
      child: Column(
        children: [
          //header
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          // end of header
          //list view
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 13,
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: Colors.grey[200]!,
                        ), // This will curve the border
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    //navigate to next page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage(product: product);
                        },
                      ),
                    );
                  },
                  child: MyProducts(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    background: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
