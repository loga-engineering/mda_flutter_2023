import "package:flutter/material.dart";

import "ui/home_page.dart";

void main() {
  runApp(const MDARestoApp());
}

class MDARestoApp extends StatelessWidget {
  const MDARestoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MDA Resto 2023",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      // home: const AddMenuItemPage(),
    );
  }
}
