import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool switchValue = false;
  int radioValue = 1;
  bool checkValue = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2.0),
            onPressed: () {},
            child: const Text("ElevatedButton"),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(),
            onPressed: () {},
            child: const Text("OutlinedButton"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("TextButton"),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            onPressed: () {},
            child: const Text("FilledButton"),
          ),
          Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              }),
          SwitchListTile(
            value: switchValue,
            title: const Text("Title"),
            subtitle: const Text("Subtitle"),
            secondary: const CircleAvatar(
              child: Text("S"),
            ),
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
          ...List.generate(3, (index) {
            return Row(
              children: [
                Radio<int>(
                  value: index,
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value ?? 1;
                    });
                  },
                ),
                Text("$index"),
              ],
            );
          }).toList(),
          ...List.generate(3, (index) {
            return RadioListTile<int>(
              value: index,
              title: Text("$index"),
              groupValue: radioValue,
              onChanged: (value) {
                setState(() {
                  radioValue = value ?? 1;
                });
              },
            );
          }).toList(),
          const SizedBox(height: 20.0),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        isAntiAlias: true,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/3892129/pexels-photo-3892129.jpeg?auto=compress&cs=tinysrgb&w=1600&lazy=load"),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rome",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Capitale de l'Italie, Rome est une grande ville cosmopolite dont l'art, l'architecture et la culture de presque 3 000 ans rayonnent dans le monde entier. Ses ruines telles que celles du Forum Romain et du Colisée évoquent la puissance de l'ancien Empire romain. Siège de l'Église catholique romaine, la Cité du Vatican compte la basilique Saint-Pierre et les musées du Vatican où se trouvent des chefs-d'œuvre tels que la fresque de la chapelle Sixtine, peinte par Michel-Ange",
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
