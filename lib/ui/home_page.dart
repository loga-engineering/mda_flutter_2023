import 'package:flutter/material.dart';
import 'package:mda_resto_2023/data/cart_data.dart';
import 'package:mda_resto_2023/data/menu_item_data.dart';
import 'package:mda_resto_2023/ui/add_menu_item_page.dart';
import 'package:mda_resto_2023/ui/order_page.dart';

import 'cart_page.dart';
import 'menu_item_card.dart';
import 'menu_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int get totalItem =>
      cartList.map((cartItem) => cartItem.quantity).fold(0, (x, y) => x + y);

  addToCart(MenuItemData menuItem) {
    int index = -1;

    for (int i = 0; i < cartList.length; i++) {
      final cartItem = cartList[i];
      if (cartItem.id == menuItem.id) {
        index = i;
        break;
      }
    }

    if (index != -1) {
      final cartItem = cartList[index];
      cartItem.quantity++;
    } else {
      final cartItem = CartItemData(menuItem, 1);
      cartList.add(cartItem);
    }

    setState(() {});
  }

  incrementCartItem(CartItemData cartItem) {
    if (cartItem.quantity >= 10) {
    } else {
      cartItem.quantity++;
    }

    setState(() {});
  }

  decrementCartItem(CartItemData cartItem) {
    if (cartItem.quantity <= 1) {
      cartList.remove(cartItem);
    } else {
      cartItem.quantity--;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      floatingActionButton: buildFAB(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("MDA Resto"),
      actions: [
        IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrderPage())),
          icon: const Icon(Icons.shop),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CartPage(incrementCartItem, decrementCartItem),
              ),
            );
          },
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 15.0, top: 5.0),
                child: CircleAvatar(
                  radius: 22.0,
                  child: Icon(Icons.shopping_cart),
                ),
              ),
              Positioned(
                top: 0,
                right: 10,
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.red,
                  child: Text(
                    "$totalItem",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: menuItemList.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = menuItemList[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuItemPage(menuItem),
            ));
          },
          child: MenuItemCard(menuItem, addToCart),
        );
      },
    );
  }

  Widget buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        MenuItemData? menuItemData = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddMenuItemPage(),
          ),
        );

        if (menuItemData == null) return;

        setState(() {
          menuItemList.add(menuItemData);
        });
      },
      child: const Icon(Icons.add),
    );
  }
}
