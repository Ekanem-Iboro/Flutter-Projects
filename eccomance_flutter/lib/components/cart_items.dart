import 'package:eccomance_flutter/models/cart.dart';
import 'package:eccomance_flutter/models/shoe_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItems extends StatefulWidget {
  ShoeModels shoe;
  CartItems({super.key, required this.shoe});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  // remove item from cart
  void removeCartItems() {
    Provider.of<CartModal>(context, listen: false).removeFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(
          widget.shoe.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          '${widget.shoe.price} ',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700]),
        ),
        trailing: IconButton(
          onPressed: removeCartItems,
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
