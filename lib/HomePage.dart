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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Hello World"),
        backgroundColor: Colors.teal,
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 100, height: 800, color: Colors.blue[100]),
          
          
          Row(
              children: [
                Container(width: 100, height: 100, color: Colors.teal[100]),
                Container(width: 100, height: 100, color: Colors.pink[100]),
              ],
            ),
          
          Container(width: 100, height: 800, color: Colors.green[100]),
        ],
      ),
    ); //scaffold
  }
}
