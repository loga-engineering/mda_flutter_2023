import "package:mda_training_test/models/menu_item.dart";
import "package:mda_training_test/models/users.dart";

enum UserOrderStatus {
  initial("Nouvelle commande"),
  inProcess("En preparation"),
  ready("Prête"),
  inDelivery("En livraison"),
  delivered("Livrée");

  final String description;

  const UserOrderStatus(this.description);
}

class UserOrder {
  User user;
  DateTime createdDate;
  List<MenuItemCart> orderItems;
  int totalAmount;
  UserOrderStatus orderStatus;

  UserOrder({
    required this.user,
    required this.createdDate,
    required this.orderItems,
    required this.totalAmount,
    required this.orderStatus,
  });

}

final orders = <UserOrder>[];