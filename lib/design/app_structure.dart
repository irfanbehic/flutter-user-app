// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:desktop/page/Page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Page2(),
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
      int counter = 0 ;
  @override
  void initState() {
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height ;
    final double screenWidth = screenInfo.size.width ;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Click"),
              onPressed: () => setState(() {
                counter = counter + 1 ;
              })
            ),
            Text("Result : ${counter}"),
          ],
        ),
      ),
    );
  }
}
