import 'package:flutter/material.dart';
import 'package:mda_resto_2023/ui/add_menu_item_page.dart';
import 'package:mda_resto_2023/data/menu_item_data.dart';

import 'cart_page.dart';
import 'menu_item_card.dart';
import 'menu_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          child: const Stack(
            children: [
              Padding(
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
                    "0",
                    style: TextStyle(fontSize: 12),
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
          child: MenuItemCard(menuItem),
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
