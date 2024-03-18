// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unnecessary_string_interpolations

import 'package:desktop/user_app/src/models/usermodel.dart';
import 'package:desktop/user_app/src/views/welcomescreen.dart';

import 'userdetail.dart';
import 'userrecord.dart';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void refreshData() {
    setState(() {
      counter = 0;
      personalResult.clear();
    });
    getUser();
  }

  final url = "http://10.0.2.2:5020/api/NpgDb/GetAllUsers";

  late int counter;
  late List<GetAllUsers> personalResult;
  late GetAllUsers user;

  Future<void> getUser() async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        List<GetAllUsers> result = getAllUsersFromJson(response.data);
        setState(() {
          counter = result.length;
          personalResult = result;
        });
        print('Counter: $counter');
      } else {
        print('Server returned status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    counter = 0;
    personalResult = [];
    getUser();
  }

  Future<void> deleteUser(GetAllUsers user, int index) async {
    try {
      var deleteurl = "http://10.0.2.2:5020/api/NpgDb/DeleteUser";
      final response = await Dio().delete(deleteurl, data: {
        "id": user.id,
        "namesurname": "",
        "email": "",
        "phonenumber": "",
        "birthdate": "",
        "teamname": "",
      });

      if (response.statusCode == 200) {
        setState(() {
          personalResult.removeAt(index);
          counter = personalResult.length;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User deleted successfully.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to delete user.'),
        ));
      }
    } catch (e) {
      print("Error deleting item: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error deleting user.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        titleTextStyle: TextStyle(),
        title: Text(
          "User App",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: Color(0xff293241),
        elevation: 0,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: counter,
          itemBuilder: (context, index) {
            String initials = personalResult[index]
                .nameSurname
                .split(' ')
                .map((word) => word[0])
                .join('')
                .toUpperCase();
            return ListTile(
              title: Text(
                '${personalResult[index].nameSurname}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff293241)
                ),
              ),
              subtitle: Text(personalResult[index].email),
              leading: CircleAvatar(
                backgroundColor: Color(0xff293241),
                child: Text(
                  initials,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteUser(personalResult[index], index);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        UserDetail(user: personalResult[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'refreshButton',
            onPressed: () {
              getUser();
            },
            tooltip: 'Refresh',
            child: Icon(Icons.refresh),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'addButton',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserRecordPage.UserRecordPage(),
                ),
              );
            },
            tooltip: 'Add User',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
