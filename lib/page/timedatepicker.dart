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
      home: const MyHomePage(title: "Date Time Picker"),
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
  var tfDate = TextEditingController();
  var tfTime = TextEditingController();
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              style: TextStyle(fontSize: 20,
              ),
              controller: tfTime,
              decoration: InputDecoration(
                hintText: "Write a Time",
                hintStyle: TextStyle(fontSize: 20)
              ),
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()) ,
                ).then((gettingTime) {
                  setState(() {
                    tfTime.text = "${gettingTime!.hour}:${gettingTime.minute}" ;
                  });
                }
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
                controller: tfDate,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Write a Date",
                  hintStyle: TextStyle(fontSize: 20)
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now() ,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2050),
                  ).then((gettingDate) {
                    setState(() {
                      tfDate.text = "${gettingDate!.day} / ${gettingDate.month} / ${gettingDate.year}" ;
                    });
                  }
                  
                  );
                },
              ),
          ),
      ],)
    );
  }
}
