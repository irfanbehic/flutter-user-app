// ignore_for_file: use_key_in_widget_constructors, must_be_immutable


//import 'package:desktop/persons.dart';
import 'package:desktop/page/pageB.dart';
import 'package:desktop/page/persons.dart';
import 'package:flutter/material.dart';


class PageA extends StatefulWidget {
  Persons person ;

  PageA({required this.person}) ;

//  Persons kisi;
 // PageA(this.kisi) ; 

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Go to Page B"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PageB()));
              },
            ),
            Text("İsim : ${widget.person.name}",style: TextStyle(fontSize: 20),),
            Text("Yaş : ${widget.person.age}",style: TextStyle(fontSize: 20)),
            Text("Boy : ${widget.person.height}",style: TextStyle(fontSize: 20)),
            Text("Bekar Mı : ${widget.person.isSingle}",style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
