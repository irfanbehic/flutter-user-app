import 'package:desktop/page/pageA.dart';
import 'package:desktop/page/persons.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    print("Çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Sayfa A'ya Git"),
              onPressed: (){

                var person = Persons(name: "İrfan Behic", age: 25, height: 187, isSingle: true) ;

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageA(person: person,)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
