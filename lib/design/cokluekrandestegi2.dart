// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Design App First Introduction"),
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

  @override
  void initState() {
   
    super.initState();
    print("Thee App Launched") ;
  }

  @override
  Widget build(BuildContext context) {

    var screenInfo = MediaQuery.of(context) ;
    final double screenHeight = screenInfo.size.height ;
    final double screenWidth = screenInfo.size.width ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: screenHeight/100),
            child: SizedBox(
              width:screenWidth / 2 ,
              height: screenHeight / 5,
              child: Image.asset("images/yemekresim.jpeg"),
            ),
          ),
          Container(width: screenWidth,height:screenHeight/4 ,color: Colors.red,),
          Text("Merhaba",style: TextStyle(fontSize: screenWidth / 10),),
        ],)
    );
  }
}
