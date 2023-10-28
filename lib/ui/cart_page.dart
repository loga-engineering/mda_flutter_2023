import 'package:flutter/material.dart';
import 'package:mda_resto_2023/ui/checkout_page.dart';

import '../data/cart_data.dart';

class CartPage extends StatefulWidget {
  final Function(CartItemData) incrementCartItem;
  final Function(CartItemData) decrementCartItem;

  const CartPage(
    this.incrementCartItem,
    this.decrementCartItem, {
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int get totalPrice =>
      cartList.map((cartItem) => cartItem.totalPrice).fold(0, (x, y) => x + y);

  incrementCartItem(CartItemData cartItem) {
    widget.incrementCartItem(cartItem);
    setState(() {});
  }

  decrementCartItem(CartItemData cartItem) {
    widget.decrementCartItem(cartItem);
    setState(() {});
  }

  goToCheckout(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CheckoutPage(),
      ),
    );

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final cartItem = cartList[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/${cartItem.menuItemData.imageName}",
                    ),
                  ),
                  title: Text(cartItem.menuItemData.title),
                  subtitle: Text(
                    "${cartItem.quantity} * ${cartItem.menuItemData.price} = ${cartItem.totalPrice} F",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => incrementCartItem(cartItem),
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () => decrementCartItem(cartItem),
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  child: Row(
                    children: [
                      Chip(
                        label: Text(
                          "$totalPrice F",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => goToCheckout(context),
                          style: ElevatedButton.styleFrom(
                            elevation: .1,
                          ),
                          child: const Text("Paiement"),
                        ),
                      ),
                    ],
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
