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
      body: Row(
        children: [
          Container(
            //margin: const EdgeInsets.all(25.0), // Boşluk verir
            margin: const EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 50),
            width: 200,
            height: 200,
            //color: Colors.blueAccent,
            child: Text("Hello Flutter Container"),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.yellowAccent,
                width: 3.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            )
        ],)
    );
  }
}
