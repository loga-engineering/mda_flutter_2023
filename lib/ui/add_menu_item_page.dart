import 'package:flutter/material.dart';
import 'package:mda_resto_2023/data/menu_item_data.dart';

import 'image_selector_page.dart';

class AddMenuItemPage extends StatefulWidget {
  const AddMenuItemPage({super.key});

  @override
  State<AddMenuItemPage> createState() => _AddMenuItemPageState();
}

class _AddMenuItemPageState extends State<AddMenuItemPage> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  String? imageName;

  selectImage(BuildContext context) async {
    final selectedImageName = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImageSelectorPage(),
      ),
    );

    if (selectedImageName == null) return;

    setState(() {
      imageName = selectedImageName;
    });
  }

  addMenuItem(BuildContext context) {
    // print("Titre = " + titleController.text);
    // print("Description = " + descriptionController.text);
    // print("Prix = " + priceController.text);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final menuItemData = MenuItemData(
      imageName: imageName!,
      title: titleController.text,
      description: descriptionController.text,
      price: int.parse(priceController.text),
    );

    Navigator.of(context).pop(menuItemData);
  }

  @override
  void initState() {
    super.initState();

    // titleController.text = "To";
    // descriptionController.text = "Plat Malien";
    // priceController.text = "2000";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout de menu"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          children: [
            const Text(
              "Titre",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Titre",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le titre est obligatoire";
                }

                return null;
              },
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              minLines: 5,
              maxLines: 10,
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "La description est obligatoire";
                }

                final isNotValid = value.length < 50;
                if (isNotValid) {
                  return "La description doit avoir au moins 50 caractères";
                }

                return null;
              },
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Prix",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                hintText: "Prix",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Le prix est obligatoire";
                }

                try {
                  int.parse(priceController.text);
                } catch (e) {
                  return "${priceController.text} n'est pas un prix correct";
                }

                return null;
              },
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Image",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                if (imageName != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        imageName = null;
                      });
                    },
                    icon: const Icon(Icons.clear),
                  )
              ],
            ),
            const SizedBox(height: 10.0),
            if (imageName != null) Image.asset("assets/images/$imageName"),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.photo_camera_outlined),
              onPressed: () => selectImage(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              label: Container(
                height: 50.0,
                alignment: Alignment.center,
                child: const Text("Selectionner l'image"),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () => addMenuItem(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                child: const Text("Valider"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
