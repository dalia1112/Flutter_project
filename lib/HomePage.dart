import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Hello World"),
        backgroundColor:Color(0xFF98FF98),
        centerTitle: true,
        actions: [
          Icon(Icons.star),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Text(counter.toString()),
          ),
        ],
      ),
      
    );
  }
}
