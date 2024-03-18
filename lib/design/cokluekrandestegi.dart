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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context ,BoxConstraints constraints){
          if(constraints.maxWidth < 600){
            return PhoneDesign() ;
          }
          else {
            return TabletDesign() ;
          }
        }
        ,),
    );
  }
}
class TabletDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/stevejobs@2x.png"),
            Text("Steve Jobs",style: TextStyle(fontSize: 30.0),),
          ],
        ),
      );
  }
}
class PhoneDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/stevejobs@1x.png"),
            Text("Steve Jobs",style: TextStyle(fontSize: 20.0),),
          ],
        ),
      );
  }
}