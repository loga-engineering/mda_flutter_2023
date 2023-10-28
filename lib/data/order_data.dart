import 'cart_data.dart';

class OrderData {

  final DateTime createdDate;

  final String fullName;
  final String phoneNumber;

  final PaymentMethod paymentMethod;
  final String inputValue;

  final int totalAmount;
  final OrderState state;

  final List<CartItemData> orderItems;

  OrderData({
    required this.createdDate,
    required this.fullName,
    required this.phoneNumber,
    required this.paymentMethod,
    required this.inputValue,
    required this.totalAmount,
    required this.state,
    required this.orderItems,
  });
}


final orderList = <OrderData>[

];


enum PaymentMethod {

  orangeMoney("Orange Money", true, "Numero Orange Money"),
  moovMoney("Moov Money", true, "Numero Moov Money"),
  samaMoney("Sama Money", true, "Numero Sama Money"),
  visa("Carte Visa", true, "Numero de carte visa"),
  cash("A la livraison", false, "");

  final String label;
  final bool needInput;
  final String inputLabel;

  const PaymentMethod(this.label, this.needInput, this.inputLabel);

}

enum OrderState {

  initial("Nouvelle"),
  inProgress("Encours"),
  ready("Prête"),
  inDelivery("En cours de livraison"),
  delivered("Livrée");

  final String label;

  const OrderState(this.label);

}