import 'package:desktop/page/pageB.dart';
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
      home: MainPage( ),
    );
  }
}

class MainPage extends StatefulWidget {
  
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {

  @override
  void initState() {
   
    super.initState();
    print("build() çalıştı.") ;
    WidgetsBinding.instance.addObserver(this) ;
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this) ;
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.inactive) {
      print("inactive() çalıştı") ;
    }
    if(state == AppLifecycleState.paused) {
      print("paused()çalıştı") ;
    }
    if(state == AppLifecycleState.resumed){
      print("resumed()çalıştı") ;
    }
    if(state == AppLifecycleState.detached){
      print("detached()çalıştı") ;      
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build() çalıştı.") ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Life Cycle"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageB()));
              },
               child: Text("Go to Page B")
               )
            
          ],
        ),
      )
    );
  }
}
