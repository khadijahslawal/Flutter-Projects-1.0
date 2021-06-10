import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //            <---  StatelessWidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstScreen> {
  String _textString = 'Hello World';
  bool _checkedValue = false;
  Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First screen')),
      body: Column(
        children: [
          GestureDetector(
              child: Text(_textString,
                  style: TextStyle(fontSize: 30, color: _textColor)),
              onTap: () {
                _changeTextColor();
              }),
          TextField(onChanged: (text) {
            _changeTextValue(text);
          }),
          CheckboxListTile(
            title: Text('This is my title'),
            value: _checkedValue,
            onChanged: (newValue) {
              _changeCheckValue(newValue);
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Text('Alert Dialog', style: TextStyle(fontSize: 25.0)),
          TextButton(
            child: Text('Press for Dialog'),
            onPressed: () {
              _showAlertDialog();
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent, primary: Colors.black),
          ),
          TextButton(
              child: Text('Navigate to Second Screen',
                  style: TextStyle(fontSize: 24)),
              onPressed: () {
                _navigateToSecondScreen(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent, primary: Colors.black)),
        ],
      ),
    );
  }

  void _changeTextValue(String text) {
    setState(() {
      _textString = text;
    });
  }

  void _changeCheckValue(bool isChecked) {
    setState(() {
      _checkedValue = isChecked;
    });
  }

  void _showAlertDialog() {
    Widget okButton = TextButton(
      child: Text('Ok'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Dialog title'),
      content: Text('This is a Flutter Alert Dialog'),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _changeTextColor() {
    setState(() {
      int randomHexColor = Random().nextInt(0xFFFFFF);
      int opaqueColor = 0xFF000000 + randomHexColor;
      _textColor = Color(opaqueColor);
    });
  }

  void _navigateToSecondScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: 'Hello'),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  final String text;
  SecondScreen({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 30.0),
          ),
          Center(
              child: TextButton(
            child: Text('Go back to first Screen',
                style: TextStyle(fontSize: 30.0)),
            style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent, primary: Colors.black),
            onPressed: () {
              _goBackToFirstScreen(context);
            },
          )),
        ],
      ),
    );
  }

  void _goBackToFirstScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
