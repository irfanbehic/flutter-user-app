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
      home: const MyHomePage(title: "Inspiration App Introduction"),
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
  }
  @override
  Widget build(BuildContext context) {
    var screenInfoo = MediaQuery.of(context) ;
    final double screenHeight1 = screenInfoo.size.height ;
    final double screenWidth1 = screenInfoo.size.width ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(162, 255, 255, 0) ,
        title: Text("Inspiration App"),
    
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight1/100, bottom: screenHeight1 / 100),
                child: SizedBox(
                  width: screenWidth1 / 4 ,
                  child: Image.asset("images/stevejobs@2x.png"),
                ),
              ),
              Text("Steve Jobs",
                style: TextStyle(
                fontSize: screenWidth1 / 20 ,
                color: Colors.red ,
                ),
             ),
             Spacer(),
              Padding(
                padding:  EdgeInsets.only(left: screenWidth1 / 100,right: screenWidth1 / 100),
                child: Text("The people who will change the world are those who are crazy enough to think they can change it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth1 / 28 ,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom:screenHeight1 / 5 ),
                child: SizedBox(
                  width: screenWidth1 / 2,
                  height: screenHeight1 / 15,
                  child:ElevatedButton(
                    child: Text("Give Inspiration",style: TextStyle(fontSize: screenWidth1 / 25),),
                    onPressed: () {
                      print("Inspiration Gived") ;
                     },
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
