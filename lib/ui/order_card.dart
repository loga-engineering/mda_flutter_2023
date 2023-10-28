import 'package:flutter/material.dart';
import 'package:mda_resto_2023/data/cart_data.dart';
import 'package:mda_resto_2023/data/order_data.dart';

class OrderCard extends StatelessWidget {

  final OrderData orderData;

  const OrderCard(this.orderData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Text("Date: ${orderData.createdDate}"),
          const SizedBox(height: 20.0),
          Text("Prix Total: ${orderData.totalAmount} F"),
          const SizedBox(height: 20.0),
          Text("Etat: ${orderData.state.label}"),
          const SizedBox(height: 20.0),
          Text("Par: ${orderData.paymentMethod.label}"),

          if(orderData.paymentMethod.needInput)
            ...[
              const SizedBox(height: 20.0),
              Text("${orderData.paymentMethod.inputLabel}: ${orderData.inputValue}"),
            ],

          const SizedBox(height: 20.0),

          SizedBox(
            height: 240.0,
            child:
            ListView.builder(
              itemCount: orderData.orderItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final orderItem = orderData.orderItems[index];

                return OrderItemCard(orderItem);
              },
            ),
          )
        ],
      ),
    );
  }
}


class OrderItemCard extends StatelessWidget {
  final CartItemData orderItem;

  const OrderItemCard(this.orderItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            "assets/images/${orderItem.menuItemData.imageName}",
            height: 120.0,
          ),
          const SizedBox(height: 12.0),
          Text(orderItem.menuItemData.title),
          const SizedBox(height: 12.0),
          Text("${orderItem.quantity} * ${orderItem.menuItemData.price}"),
          const SizedBox(height: 12.0),
          Text("${orderItem.totalPrice} F"),
        ],
      ),
    );
  }
}
