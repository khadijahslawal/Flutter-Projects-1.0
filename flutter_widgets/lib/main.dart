// importing this package gives us the dart widgets
// as well as the Material Theme widgets
import 'package:flutter/material.dart';

// the main() function is the starting point for every Flutter project
void main() {
  // calling this method (you guessed it) runs our app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  //The build context rebuilds the widget if any changes occur and allows the hot reload to work
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exploring Widgets', style: TextStyle(fontSize: 24.0)),
        ),
        body: myWidget(),
      ),
    );
  }
}

Widget myWidget() {
  // return Column(children: [
  //   TextField(
  //     decoration: InputDecoration(
  //         // border: InputBorder.none,
  //         hintText: 'Write Something Here'),
  //   ),
  //   TextButton(
  //     child: const Text('Button'),
  //     style: TextButton.styleFrom(
  //         backgroundColor: Colors.green, primary: Colors.white),
  //     onPressed: () {},
  //   ),
  return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemExtent: 30.0,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Row $index'),
          onTap: () {},
        );
      });
  // ]);
}
