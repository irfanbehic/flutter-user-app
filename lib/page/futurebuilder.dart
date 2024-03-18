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
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<int> calcfact(int num) async {
    int res = 1 ;
    for(int i=1 ; i<= num;i++){
      res = res*i ;
    }
    return res ;
  }

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Future Builder"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: calcfact(8),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  print("Error : ${snapshot.error}") ;
                }
                if(snapshot.hasData){
                  return Text("Result : ${snapshot.data}",
                  style:TextStyle(
                    fontSize: 25 ,
                  ),
                
                ) ;
                }
                else{
                  return Text("Result : No Result ...") ; 
                }
              }
            )
        ],),
      )
    );
  }
}
