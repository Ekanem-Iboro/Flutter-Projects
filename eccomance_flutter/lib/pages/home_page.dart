import 'package:eccomance_flutter/components/bottom_nav_bar.dart';
import 'package:eccomance_flutter/pages/cart_page.dart';
import 'package:eccomance_flutter/pages/shop.dart';
import 'package:flutter/material.dart';

// Define Enum for Page Indexes
enum PageIndex {
  shop,
  cart,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _selectedIndex = 0;
  // Update _selectedIndex to use the PageIndex enum
  PageIndex _selectedPage = PageIndex.shop;
  // Page to display
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  // void _navigateBottomBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // void _onDrawerTap(int index, BuildContext context) {
  //   setState(() {
  //     _selectedIndex = index; // Update Bottom Navigation Bar
  //   });
  //   Navigator.pop(context); // Close the drawer
  // }

  // Method to handle bottom navigation
  void _navigateBottomBar(PageIndex pageIndex) {
    setState(() {
      _selectedPage = pageIndex; // Update the selected page
    });
  }

  // Method to handle drawer taps
  void _onDrawerTap(PageIndex pageIndex, BuildContext context) {
    setState(() {
      _selectedPage = pageIndex; // Update Bottom Navigation Bar
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: _pages[_selectedPage
          .index], // Display the correct page based on selected index

      ////
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.only(top: 70),
                child: Image.asset(
                  'assets/images/nike-logo.png',
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  color: Colors.grey[800],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () => _onDrawerTap(
                        PageIndex.shop, context), // Navigate to Shop page
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                  ),
                  ListTile(
                    onTap: () => _onDrawerTap(
                        PageIndex.cart, context), // Navigate to Cart page
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text('Cart'),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                  ),
                ],
              ),
              const Spacer(),
              const ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                textColor: Colors.white,
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),

      ///
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => _navigateBottomBar(PageIndex.values[index]),
        // onTabChange: (index) => _navigateBottomBar(index),
        indselected: _selectedPage.index,
      ),
    );
  }
}
