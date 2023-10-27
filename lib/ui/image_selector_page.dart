import 'package:flutter/material.dart';

class ImageSelectorPage extends StatefulWidget {
  const ImageSelectorPage({super.key});

  @override
  State<ImageSelectorPage> createState() => _ImageSelectorPageState();
}

class _ImageSelectorPageState extends State<ImageSelectorPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection d'image"),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final imageName = images[index];
          final selected = selectedIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                if (selected) {
                  selectedIndex = -1;
                } else {
                  selectedIndex = index;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.all(selected ? 10.0 : 0.0),
              child: Image.asset("assets/images/$imageName"),
            ),
          );
        },
      ),
      floatingActionButton: selectedIndex == -1
          ? null
          : FloatingActionButton(
              onPressed: () {
                final selectedImageName = images[selectedIndex];
                Navigator.of(context).pop(selectedImageName);
              },
              child: const Icon(Icons.check),
            ),
    );
  }
}

final images = [
  "pexels-photo-628776.jpeg", // 0
  "pexels-photo-821365.jpeg", // 1
  "pexels-photo-853006.jpeg",
  "pexels-photo-1092730.jpeg",
  "pexels-photo-1351238.jpeg",
  "pexels-photo-1410236.jpeg",
  "pexels-photo-1583884.jpeg",
  "pexels-photo-1640777.jpeg",
  "pexels-photo-3026805.jpeg",
  "pexels-photo-3186654.jpeg",
  "pexels-photo-3535383.jpeg",
  "pexels-photo-3756523.jpeg",
  "pexels-photo-3758053.jpeg",
];
