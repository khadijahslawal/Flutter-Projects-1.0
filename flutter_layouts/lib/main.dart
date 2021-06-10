import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Building Layouts')),
        body: myLayoutWidget(),
      ),
    );
  }
}

Widget myLayoutWidget() {
  Widget firstRow() {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.account_balance, color: Colors.green)),
        Text(
          "Beams",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget secondRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
      child: Text(
        'Send programmable push notifications to Android and IOS devices with delivery and open rate tracking built in',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget thirdRow() {
    return Row(
      children: [
        Text('Explore Beams', style: TextStyle(color: Colors.green)),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(Icons.arrow_forward, color: Colors.green),
        ),
      ],
    );
  }

  return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.purple[900],
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        //makes the column fits into its content
        mainAxisSize: MainAxisSize.min,
        children: [
          firstRow(),
          secondRow(),
          thirdRow(),
        ],
      ));
}
