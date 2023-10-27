import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {

  final String imageName;
  final String title;
  final String description;
  final int price;

  const MenuCard({
    super.key,
    required this.imageName,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.asset("assets/images/$imageName"),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "$price F",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,

                    ),
                    onPressed: () {},
                    child: const SizedBox(
                      child:  Text("Ajouter au panier", style: TextStyle(
                        color: Colors.black,
                      ),),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
