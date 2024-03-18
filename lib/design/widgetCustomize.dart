// ignore_for_file: must_be_immutable

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
    print("The App Launched") ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlueBox(),
            SizedBox(height: 20,),
            GreenBox(),
            SizedBox(height: 20,),
            RedBox(),
            Text1("Merhaba", 30.0),
              ],
            )
         ,)
    );
  }
}

class BlueBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(width: 100,height: 100,color: Colors.blue,) ;
  }

}
class GreenBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(width: 100,height: 100,color: Colors.green,) ;
    
  }

}
class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 100,height: 100,color: Colors.red);
  }
}
class Text1 extends StatelessWidget {
  String content ;
  double fontSize ;
  Text1(this.content,this.fontSize) ;

  
  @override
  Widget build(BuildContext context) {
    return Text(content, style: TextStyle(fontSize: fontSize),) ;
  }
}