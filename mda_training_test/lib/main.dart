import "package:flutter/material.dart";

import "ui/menu_page.dart";


void main() {
  runApp(TrainingApp());
}

class TrainingApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MDA Training App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MenuPage(),
    );
  }
}

Future<T?> navigateTo<T>(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (context) => page));
}

