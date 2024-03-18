// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:desktop/user_app/src/models/usermodel.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRecordPage extends StatefulWidget {
  const UserRecordPage.UserRecordPage({super.key});

  @override
  State<UserRecordPage> createState() => _UserRecordPageState();
}

final List<String> teamsList = [
  "-",
  "Fenerbahçe",
  "Galatasaray",
  "Beşiktaş",
  "Trabzonspor",
  "Başakşehir",
  "Alanyaspor",
  "Sivasspor",
  "Göztepe",
  "Kasımpaşa",
  "Antalyaspor",
  "Konyaspor",
  "Gaziantep FK",
  "Gençlerbirliği",
  "Denizlispor",
  "Rizespor",
  "Erzurumspor",
  "Hatayspor",
  "Karagümrük"
];

class _UserRecordPageState extends State<UserRecordPage> {
  late List<GetAllUsers> personalResult;
  final tfusername = TextEditingController();
  final tfphonenumber = TextEditingController();
  final tfemail = TextEditingController();
  final tfbirthdate = TextEditingController();
  final tfteamname = TextEditingController();

  String? choosenteam = teamsList.first;
  DateTime? selectedDate;

  String? validateNameSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name and surname.';
    }
    if (value.length > 30) {
      return 'Name and surname should be less than 30 characters.';
    }
     if (!RegExp(r'^[a-zA-ZğüşöçİĞÜŞÖÇ\s]+$').hasMatch(value)) {
    return 'Name and surname should only contain letters and spaces using Turkish characters.';
  }
    List<String> nameParts = value.split(' ');
    if (nameParts.length < 2) {
      return 'Please enter at least two words for name and surname.';
    }
    if (nameParts[0].isEmpty || nameParts[1].isEmpty) {
      return "Name or surname shouldn't be empty.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    if (value.length > 30) {
      return 'Email address should be less than 30 characters.';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number.';
    }
    if (value.length >= 12 || value.length < 11) {
      return 'Phone number should be at most 11 digits.';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should only contain digits.';
    }
    if (value[0] != "0") {
      return "Phone number must starts with 0 ";
    }
    return null;
  }

  String? validateBirthDate(DateTime? value) {
    if (value == null) {
      return 'Please select a birth date.';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        tfbirthdate.text = picked.toString().substring(0, 10);
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text("Please select a birth date."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> postUser(String nameSurname, String email, String phoneNumber,
      DateTime? birthDate, String teamName) async {
    try {
      String? nameSurnameError = validateNameSurname(nameSurname);
      String? emailError = validateEmail(email);
      String? phoneNumberError = validatePhoneNumber(phoneNumber);

      if (nameSurnameError != null) {
        throw Exception(nameSurnameError);
      }
      if (emailError != null) {
        throw Exception(emailError);
      }
      if (phoneNumberError != null) {
        throw Exception(phoneNumberError);
      }
      if (birthDate == null) {
        throw Exception("Please select a birth date.");
      }

      String formattedDate = birthDate.toIso8601String();
      var postUrl = "http://10.0.2.2:5020/api/NpgDb/SaveUser";
      final response = await Dio().post(postUrl, data: {
        "namesurname": nameSurname,
        "email": email,
        "phonenumber": phoneNumber,
        "birthdate": formattedDate,
        "teamname": teamName,
      });

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text("User registered successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Okay"),
                ),
              ],
            );
          },
        );
      } else {
        throw Exception(
            "Registration failed. Error code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error adding item: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Okay"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        title: Text(
          "User Record Page",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color(0xff293241),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: tfusername,
                decoration: InputDecoration(
                  label: Text("Name - Surname"),
                ),
                validator: validateNameSurname,
              ),
              TextFormField(
                controller: tfemail,
                decoration: InputDecoration(
                  label: Text("Email"),
                ),
                validator: validateEmail,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: tfphonenumber,
                decoration: InputDecoration(
                  label: Text("Phone Number"),
                ),
                validator: validatePhoneNumber,
              ),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: tfbirthdate,
                    decoration: InputDecoration(labelText: "Birth Date"),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: choosenteam,
                items: teamsList.map((team) {
                  return DropdownMenuItem<String>(
                    child: Text(team),
                    value: team,
                  );
                }).toList(),
                onChanged: ((value) {
                  setState(() {
                    choosenteam = value;
                  });
                }),
                decoration: InputDecoration(labelText: "Team Name"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          postUser(
            tfusername.text,
            tfemail.text,
            tfphonenumber.text,
            selectedDate,
            choosenteam ?? "",
          );
        },
        tooltip: "Add New User",
        icon: Icon(Icons.save_rounded),
        label: Text("Save"),
      ),
    );
  }
}
