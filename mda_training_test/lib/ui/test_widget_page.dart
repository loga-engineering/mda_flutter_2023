import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class TestWidgetsPage extends StatefulWidget {
  @override
  _TestWidgetsPageState createState() => _TestWidgetsPageState();
}

class _TestWidgetsPageState extends State<TestWidgetsPage> {
  bool switchValue = false;
  bool switchValueL = false;
  bool checkboxValue = false;
  bool checkboxValueL = false;
  bool radioValue = false;
  int radioGroupValue = 1;
  double sliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40.0,
        ),
        children: [
          Switch(
            value: switchValue,
            onChanged: (value) => setState(() => switchValue = value),
          ),
          SwitchListTile(
            title: const Text("Switch"),
            value: switchValueL,
            onChanged: (value) => setState(() => switchValueL = value),
          ),
          Checkbox(
            value: checkboxValue,
            onChanged: (value) {
              setState(() {
                checkboxValue = value ?? false;
              });
            },
          ),
          CheckboxListTile(
            value: checkboxValueL,
            onChanged: (value) {
              setState(() {
                checkboxValueL = value ?? false;
              });
            },
          ),
          ...List.generate(
              5,
                  (index) =>
                  RadioListTile<int>(
                    value: index,
                    groupValue: radioGroupValue,
                    title: Text("Element $index"),
                    onChanged: (value) {
                      setState(() {
                        radioGroupValue = value ?? 1;
                      });
                    },
                  )).toList(),
          CupertinoSwitch(
            value: switchValueL,
            onChanged: (value) {
              setState(() {
                switchValueL = value;
              });
            },
          ),
          CupertinoTextField(
            keyboardType: TextInputType.number,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
          ),
          TextFormField(),
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              minimumDate: DateTime.now(),
              maximumDate: DateTime.now().add(Duration(days: 10)),
              onDateTimeChanged: (date) {},
            ),
          ),
          Slider(
            min: 0,
            max: 30,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          CupertinoButton(child: Text('Bonjour'), onPressed: () {}),
          CupertinoSlider(
            min: 0,
            max: 30,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
          ),
          Text('Valeur slider : $sliderValue', textAlign: TextAlign.center),
          SizedBox(height: 20.0),
          CupertinoSearchTextField(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            onChanged: (value) {
              print('## $value');
            },
          ),
          CupertinoTimerPicker(onTimerDurationChanged: (value) {
            print('#### $value');
          }),
        ],
      ),
    );
  }
}
