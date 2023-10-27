import 'package:flutter/material.dart';

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
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Nom"), border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  label: Text("Prenom"), border: OutlineInputBorder()),
            ),
          ),
          Switch(value: true, onChanged: (value) {}),
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.access_alarm_outlined),
          ),
          OutlinedButton(onPressed: () {}, child: const Text("Valider")),
          const SizedBox(height: 20.0),
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.blue, width: 10.0),
              boxShadow: const [
                 BoxShadow(
                    color: Colors.green,
                    offset: Offset(10.0, 20.0),
                    blurRadius: 20.0),
              ],
            ),
          ),

          Container(
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                fit: BoxFit.fill,
                isAntiAlias: true,
                image: NetworkImage("https://medias.lavie.fr/api/v1/images/view/61f2d5778fe56f7867643e10/width_1000/image.jpg")
              )
            ),
          ),

          const SizedBox(height: 20.0),

          Image.network("https://medias.lavie.fr/api/v1/images/view/61f2d5778fe56f7867643e10/width_1000/image.jpg")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
