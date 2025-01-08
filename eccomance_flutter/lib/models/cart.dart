import 'package:eccomance_flutter/models/shoe_models.dart';
import 'package:flutter/material.dart';

class CartModal extends ChangeNotifier {
  // list of shoes for sale
  List<ShoeModels> sheoShop = [
    ShoeModels(
      id: 1,
      name: 'Nike Air Zoom Pegasus 37',
      desc: 'Comfortable, breathable shoe for everyday wear',
      price: '150.0',
      imagePath: 'assets/images/nike1.png',
    ),
    ShoeModels(
      id: 2,
      name: 'Nike Air Max 270 React',
      desc: 'Stylish and comfortable sneaker with React technology',
      price: '180.0',
      imagePath: 'assets/images/nike2.png',
    ),
    ShoeModels(
      id: 3,
      name: 'Nike Free RN 5.0',
      desc: 'Lightweight and flexible shoe for daily training',
      price: '120.0',
      imagePath: 'assets/images/nike3.png',
    ),
    ShoeModels(
      id: 4,
      name: 'Nike ZoomX Vaporfly NEXT%',
      desc: 'High-performance running shoe designed for speed',
      price: '250.0',
      imagePath: 'assets/images/nike4.png',
    ),
    ShoeModels(
      id: 5,
      name: 'Nike Air Force 1 Low',
      desc: 'Classic and iconic low-top sneaker',
      price: '90.0',
      imagePath: 'assets/images/nike5.png',
    ),
    ShoeModels(
      id: 6,
      name: 'Nike SB Dunk Low',
      desc: 'Skateboarding-inspired sneaker with cushioned support',
      price: '110.0',
      imagePath: 'assets/images/nike6.png',
    ),
    ShoeModels(
      id: 7,
      name: 'Nike React Infinity Run Flyknit',
      desc: 'A durable and cushioned running shoe for long-distance runs',
      price: '160.0',
      imagePath: 'assets/images/nike7.png',
    ),
  ];

  //list of items in user cart
  List<ShoeModels> userCart = [];

  //get the sheoes for sale
  List<ShoeModels> getSheoesForSale() {
    return sheoShop;
  }

  // get the cart items
  List<ShoeModels> getCartItems() {
    return userCart;
  }
  //   // check if item exists in cart
  // bool isInCart(ShoeModels shoe) {
  //   return userCart.any((item) => item.id == shoe.id);
  // }

  // // add a shoe to the cart
  // bool addToCart(ShoeModels shoe) {
  //   if (isInCart(shoe)) {
  //     return false; // Item already exists
  //   }
  //   userCart.add(shoe);
  //   notifyListeners();
  //   return true; // Item added successfully
  // }

  // Add to cart method
  bool addToCart(ShoeModels shoe) {
    bool isAlreadyInCart = userCart.any((item) => item.id == shoe.id);

    if (isAlreadyInCart) {
      return false; // Item already in the cart
    } else {
      userCart.add(shoe);
      notifyListeners();
      return true; // Item added successfully
    }
  }

  // remove a shoe from the cart
  void removeFromCart(ShoeModels shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
