import 'package:mda_resto_2023/data/menu_item_data.dart';

class CartItemData {
  MenuItemData menuItemData;
  int quantity;

  int get totalPrice => menuItemData.price * quantity;

  CartItemData(this.menuItemData, this.quantity);
}

final cartList = [
  CartItemData(menuItemList[1], 2),
  CartItemData(menuItemList[0], 3),
];
