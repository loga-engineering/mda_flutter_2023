import "package:flutter/material.dart";
import "package:mda_training_test/models/menu_item.dart";

class MenuItemCard extends StatelessWidget {
  final MenuItemData menuItem;
  final void Function(BuildContext, MenuItemData) onAddMenuItemToCart;

  const MenuItemCard(
    this.menuItem,
    this.onAddMenuItemToCart, {
    super.key,
  });

  addToCart(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.grey.withOpacity(.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(height: 300.0, width: double.maxFinite),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                bottom: 60.0,
                child: Hero(
                  tag: "mainImage-${menuItem.id}",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/${menuItem.mainImage}",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Hero(
                  tag: "secondaryImage-${menuItem.id}",
                  child: Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 8.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/${menuItem.secondaryImage}",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Text(
                  menuItem.title,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  menuItem.description,
                  style: const TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RawChip(
                      backgroundColor: Colors.deepOrangeAccent.withOpacity(.9),
                      label: Text(
                        '${menuItem.price} F',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // const Spacer(),
                    ElevatedButton(
                      child: Text(
                        "Ajouter au panir",
                        style: const TextStyle(
                          // color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: StadiumBorder(),
                      ),
                      onPressed: () => onAddMenuItemToCart(context, menuItem),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
