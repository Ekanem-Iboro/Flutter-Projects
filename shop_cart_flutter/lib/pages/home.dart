import 'package:flutter/material.dart';
import 'package:shop_cart_flutter/pages/cart_page.dart';
import 'package:shop_cart_flutter/pages/product_list_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List<Widget> pages = const [
    ProductListPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(235, 240, 253, 1),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: ''),
        ],
      ),
    );
  }
}
