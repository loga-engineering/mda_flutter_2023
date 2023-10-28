import 'package:flutter/material.dart';
import 'package:mda_resto_2023/data/order_data.dart';

import 'order_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes commandes"),
      ),
      body: ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return OrderCard(orderList[index]);
        },
      ),
    );
  }
}
