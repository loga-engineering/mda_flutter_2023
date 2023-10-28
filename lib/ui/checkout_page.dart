import 'package:flutter/material.dart';

import '../data/cart_data.dart';
import '../data/order_data.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  PaymentMethod paymentMethod = PaymentMethod.orangeMoney;

  final inputValueController = TextEditingController();

  int get totalAmount =>
      cartList.map((cartItem) => cartItem.totalPrice).fold(0, (x, y) => x + y);

  checkout(BuildContext context) {
    if (cartList.isEmpty) return;
    if (!formKey.currentState!.validate()) return;

    final order = OrderData(
      createdDate: DateTime.now(),
      fullName: fullNameController.text,
      phoneNumber: phoneNumberController.text,
      paymentMethod: paymentMethod,
      inputValue: paymentMethod.needInput ? inputValueController.text : "",
      totalAmount: totalAmount,
      state: OrderState.initial,
      orderItems: [...cartList],
    );

    cartList.clear();

    orderList.add(order);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paiement"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 40.0,
          ),
          children: [
            TextFormField(
              controller: fullNameController,
              decoration: const InputDecoration(
                label: Text("Nom et prenom"),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le nom est obligatoire";
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                label: Text("Numéro de telephone"),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le numéro de téléphone est obligatoire";
                }
                return null;
              },
            ),
            const SizedBox(height: 40.0),
            const Text("Mode de paiement"),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: PaymentMethod.values.length,
              itemBuilder: (context, index) {
                final pm = PaymentMethod.values[index];
                return RadioListTile<PaymentMethod>(
                  value: pm,
                  title: Text(pm.label),
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = pm;
                    });
                  },
                );
              },
            ),
            if (paymentMethod.needInput) ...[
              const SizedBox(height: 20.0),
              TextFormField(
                controller: inputValueController,
                decoration: InputDecoration(
                  label: Text(paymentMethod.inputLabel),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Le ${paymentMethod.inputLabel} est obligatoire";
                  }
                  return null;
                },
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              const SizedBox(height: 20.0),
              Text(
                "Total : $totalAmount",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(height: 20.0),
              const Divider(),
              ElevatedButton(
                onPressed: () => checkout(context),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text("Payer"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
