// ignore_for_file: prefer_const_constructors, sort_child_properties_last

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
      home: const MyHomePage(title: "Text , Button and Textfield"),
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
  var tfController = TextEditingController() ;
  String gettingData = "" ;
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: tfController,
              obscureText: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 10,
              style: TextStyle(color: Colors.greenAccent),
              decoration: InputDecoration(
                hintText: "Write",
                hintStyle: TextStyle(
                  color: Colors.blue
                ),
              labelText: "Name",
              labelStyle: TextStyle(
                fontSize: 25,
              )
              ),
            ),
          ),
          ElevatedButton(
            onPressed:() {
              setState(() {
                gettingData = tfController.text ;
              });
            },
             child: Text("Get Data",style: TextStyle(color: Colors.black),),
             style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,

             ),
             ),
             
          Text("Gelen Data : ${gettingData}",style: TextStyle(fontSize: 20),),
      ],)
    );
  }
}
