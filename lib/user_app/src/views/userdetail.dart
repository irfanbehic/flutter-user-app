// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:desktop/user_app/src/models/teamsmodel.dart';
import 'package:desktop/user_app/src/models/usermodel.dart';

import 'package:desktop/user_app/src/views/userrecord.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserDetail extends StatefulWidget {
  GetAllUsers user;
  UserDetail({required this.user});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

final teamslist = TeamsListModel();
String? choosenteam;

class _UserDetailState extends State<UserDetail> {
  var tfusername = TextEditingController();
  var tfphonenumber = TextEditingController();
  var tfemail = TextEditingController();
  var tfbirthdate = TextEditingController();
  var tfteamname = TextEditingController();
  bool isSelectedDate = false;
  DateTime? selectedDate;

  String? validateNameSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name and surname.';
    }
    if (value.length > 30) {
      return 'Name and surname should be less than 30 characters.';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name and surname should only contain letters and spaces.';
    }
    List<String> nameParts = value.split(' ');
    if (nameParts.length < 2) {
      return 'Please enter at least two words for name and surname.';
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
      isSelectedDate = true;
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

  Future<void> updateUser(String nameSurname, String email, String phoneNumber,
      DateTime? birthDate, String teamName) async {
    try {
      String? nameSurnameError = validateNameSurname(nameSurname);
      String? emailError = validateEmail(email);
      String? phoneNumberError = validatePhoneNumber(phoneNumber);
      if (isSelectedDate) {
        String? birthDateError = validateBirthDate(birthDate);
        if (birthDateError != null) {
          throw Exception(birthDateError);
        }
        ;
      }

      if (nameSurnameError != null) {
        throw Exception(nameSurnameError);
      }
      if (emailError != null) {
        throw Exception(emailError);
      }
      if (phoneNumberError != null) {
        throw Exception(phoneNumberError);
      }
      if (teamName.isEmpty || !teamsList.contains(teamName)) {
        throw Exception(
            "Invalid team name. Please select a team from the Turkish Süper Lig.");
      }

      var formattedDate =
          isSelectedDate ? selectedDate!.toIso8601String() : tfbirthdate.text;

      var postUrl = "http://10.0.2.2:5020/api/NpgDb/UpdateUser";
      final response = await Dio().patch(postUrl, data: {
        "id": widget.user.id,
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
              title:
                  response.data == "Success" ? Text("Success") : Text("Error"),
              content: response.data == "Success"
                  ? Text("User updated successfully.")
                  : Text(response.data),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    //Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Okay"),
                ),
              ],
            );
          },
        );
      } else {
        throw Exception("Update failed. Error code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error updating user: $e");
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

    tfusername.text = widget.user.nameSurname;
    tfphonenumber.text = widget.user.phoneNumber;
    tfemail.text = widget.user.email;
    tfbirthdate.text = widget.user.birthDate.toString().substring(0, 10);
    tfteamname.text = widget.user.teamName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe0fbfc),
      appBar: AppBar(
        title: Text(
          "User Detail Page",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Color(0xff293241),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: tfusername,
                  decoration: InputDecoration(
                    label: Text(
                      "Name - Surname",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff293241)),
                    ),
                  ),
                ),
                TextField(
                  controller: tfphonenumber,
                  decoration: InputDecoration(
                    label: Text(
                      "Phone Number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff293241)),
                    ),
                  ),
                ),
                TextField(
                  controller: tfemail,
                  decoration: InputDecoration(
                    label: Text(
                      "Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff293241)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: IgnorePointer(
                    child: TextField(
                      controller: tfbirthdate,
                      decoration: InputDecoration(
                          labelText: "Birth Date",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff293241),
                          )),
                    ),
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: tfteamname.text,
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
                  decoration: InputDecoration(
                      labelText: "Team Name",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff293241))),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          updateUser(
            tfusername.text,
            tfemail.text,
            tfphonenumber.text,
            selectedDate,
            choosenteam ?? "",
          );
          ;
        },
        tooltip: "Update User",
        icon: Icon(Icons.browser_updated_rounded),
        label: Text("Update"),
      ),
    );
  }
}
