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
      home: const MyHomePage(title: "Demo App"),
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
  var tfDate = TextEditingController();
  var tfTime = TextEditingController();

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
      body:  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: tfController,
              decoration: InputDecoration(
                labelText: "Name - Surname",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                )
              ),
            ),
            TextField(
              controller: tfController,
              decoration: InputDecoration(
                labelText: "E-Mail",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                )
              ),
            ),
            TextField(
              controller: tfController,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ) 
              ),
            ),
            TextField(
              controller: tfController,
              decoration: InputDecoration(
                labelText: "Birth Date",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ) 
              ),
            ),
            TextField(
              controller: tfController,
              decoration: InputDecoration(
                labelText: "Team",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ) 
              ),
            ),

            ElevatedButton(
              child: Text("Create",style:TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder()
              ),
              onPressed: () {
                
              },
            
              )
        ],
        ),
      )
    );
  }
}
