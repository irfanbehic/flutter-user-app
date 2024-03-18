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
      home: const MyHomePage(title: "Login App"),
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
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height ;
    final double screenWidth = screenInfo.size.width ;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: screenHeight / 20),
                child: SizedBox(
                  width: screenWidth / 4,
                  height: screenHeight/ 4,
                  child: Image.asset("images/logo.png"),
                ),
              ), 
              Padding(
                padding:  EdgeInsets.all(screenHeight / 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    filled: true ,
                    fillColor: Colors.white ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )
                  ),
                ),
              ), 
              Padding(
                padding:  EdgeInsets.all(screenHeight / 40),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Pasword",
                    filled: true ,
                    fillColor: Colors.white ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )
                  ),
                ),
              ),  
              Padding(
                padding:  EdgeInsets.all(screenHeight / 40),
                child: SizedBox(
                  width: screenWidth / 2.2,
                  height: screenHeight / 12,
                  child: ElevatedButton(
                 onPressed: (){
                  print("Logged in") ;
                 },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 158, 221),
                
                  foregroundColor: Colors.white
                 ),
                 child:
                  Text("Login",style: TextStyle(fontSize: screenWidth / 25),)
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  print("Help Tapped") ;
                },
                child: Text("Help?",style: 
                TextStyle(
                fontSize: screenWidth / 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
              ),
              )
              
            ],  
          ),
        ),
      )
    );
  }
}
