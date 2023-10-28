import 'package:mda_resto_2023/data/menu_item_data.dart';

class CartItemData {
  MenuItemData menuItemData;
  int quantity;

  int get id => menuItemData.id;
  int get totalPrice => menuItemData.price * quantity;

  CartItemData(this.menuItemData, this.quantity);
}

final cartList = <CartItemData>[
];
