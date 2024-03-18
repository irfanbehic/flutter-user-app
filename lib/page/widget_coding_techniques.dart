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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
bool control1 = false;
  @override
  void initState() {
   
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Coding Techniques"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          Text(control1 ? "True" : "False", 
            style: TextStyle(
              color:control1 ? Colors.blue : Colors.red,
              fontSize: control1 ? 20 : 50 ,
              fontWeight: control1 ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            
            ElevatedButton(
              onPressed:() {
                setState(() {
                  control1 = true ;
                });
              },
               child: Text("Status 1")
               ),
            ElevatedButton(
              onPressed:() {
                setState(() {
                  control1 = false ;
                });
              },
               child: Text("Status 2")
               )   
          ],
        ),
      )
    );
  }
}
