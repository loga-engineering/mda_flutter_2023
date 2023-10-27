import 'package:flutter/material.dart';

import '../data/cart_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: ListView.builder(
        itemCount: cartList.length,
          itemBuilder: (context, index) {
            final cartItem = cartList[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/${cartItem.menuItemData.imageName}"),
              ),
              title: Text(cartItem.menuItemData.title),
              subtitle: Text("${cartItem.quantity}"),
              trailing: Chip(
                label: Text("${cartItem.totalPrice} F"),
              ),
            );
          },
      ),
    );
  }
}


