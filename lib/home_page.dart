import 'package:flutter/material.dart';

import 'menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("MDA Resto"),
      ),
      body: ListView(
        children: const [
           MenuCard(
             imageName: "pexels-photo-628776.jpeg",
             title: "Fakoye",
             description: "Le Fakoye est un mets malien apprécié pour sa simplicité et sa "
                 "saveur authentique. Il s'agit d'un plat à base de riz, "
                 "préparé avec des feuilles de baobab séchées, "
                 "qui sont communément appelées \"feuilles de Fakoye\" d'où le nom du plat."
                 " Ces feuilles apportent une saveur unique au plat.\n"
                 "Le Fakoye est un exemple de la diversité de la cuisine "
                 "malienne et de son utilisation ingénieuse d'ingrédients locaux pour créer des plats délicieux.",
             price: 2000,
           ),
           MenuCard(
             imageName: "pexels-photo-1351238.jpeg",
             title: "Mafé",
             description: "Le Mafé est un plat malien à base de viande (généralement du bœuf ou du poulet) cuit dans une délicieuse sauce d'arachide, agrémentée de légumes comme les carottes, les patates douces et les aubergines. Il est souvent accompagné de riz ou de couscous malien. La sauce d'arachide confère au plat une saveur crémeuse et légèrement épicée.",
             price: 2500,
           ),
           MenuCard(
             imageName: "pexels-photo-1640777.jpeg",
             title: "Kedjenou",
             description: "Le Kedjenou est un ragoût traditionnel malien préparé avec du poulet ou de la viande, des légumes (comme des tomates, des oignons et des poivrons) et des épices. Le plat est cuit lentement dans un pot en terre cuite scellé pour que les saveurs se mélangent parfaitement. C'est un plat savoureux et parfumé, généralement servi avec du riz.",
             price: 3000,
           ),
        ],
      ),
    );
  }
}
