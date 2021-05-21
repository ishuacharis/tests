import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _currentSliderValue = 12;
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: [
          Switch(value: _switchValue,
              onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Font size"),
                   Slider(
                      value: _currentSliderValue,
                      min: 12,
                      max: 48,
                      divisions: 2,
                      onChanged: (double value){
                        setState(() {
                          _currentSliderValue = value;
                        });
                      })
                                  ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


