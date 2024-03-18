// To parse this JSON data, do
//
//     final getAllUsers = getAllUsersFromJson(jsonString);

import 'dart:convert';

List<GetAllUsers> getAllUsersFromJson(List<dynamic> json) => List<GetAllUsers>.from(json.map((x) => GetAllUsers.fromJson(x)));
String getAllUsersToJson(List<GetAllUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllUsers {
    int id;
    String nameSurname;
    String email;
    String phoneNumber;
    DateTime birthDate;
    String teamName;

    GetAllUsers({
        required this.id,
        required this.nameSurname,
        required this.email,
        required this.phoneNumber,
        required this.birthDate,
        required this.teamName,
    });

    factory GetAllUsers.fromJson(Map<String, dynamic> json) => GetAllUsers(
        id: json["id"],
        nameSurname: json["nameSurname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        birthDate: DateTime.parse(json["birthDate"]),
        teamName: json["teamName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameSurname": nameSurname,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthDate": birthDate.toIso8601String(),
        "teamName": teamName,
    };
}
