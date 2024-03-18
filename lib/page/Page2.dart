// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List User"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello New Page"),

          ],
        ),
      ),
    );
  }
}