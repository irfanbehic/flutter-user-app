import 'package:desktop/page/page_transitions.dart';
import 'package:flutter/material.dart';


class PageB extends StatefulWidget {
  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  Future<bool> returnkey(BuildContext context) async {
    print("Return Key clicked") ;
    return false ; 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page B"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print("Appbar geri tuşu tıklandı");
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => returnkey(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Geldiği Sayfaya Dön"),
                onPressed: (){
        
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text("Anasayfaya Dön"),
                onPressed: (){
        
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              ElevatedButton(
                child: Text("Anasayfaya Geçiş Yap"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
