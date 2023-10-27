import "package:flutter/material.dart";
import "home_page.dart";

void main() {
  runApp(const MDARestoApp());
}

class MDARestoApp extends StatelessWidget {
  const MDARestoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MDA Resto 2023",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const HomePage(),
    );
  }
}