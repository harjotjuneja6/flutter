import 'package:flutter/material.dart';
import 'package:vj/views/loginpage.dart';
import 'package:vj/views/logout.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//import 'package:vj/views/detailed.dart';

Future<Profile> fetchProfile() async {
  final response = await http.get(Uri.http('10.0.2.2:4000', 'getGroup'));
  if (response.statusCode == 200) {
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to Load");
  }
}

class Profile {
  final String name;
  final String description;
  final String phoneNumber;
  final String genre;

  Profile({this.name, this.description, this.genre, this.phoneNumber});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json['name'],
        description: json['description'],
        genre: json['genre'],
        phoneNumber: json['phoneNo']);
  }
}

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  Future<Profile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            child: Text("Logout"),
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
        ),
      ),
      body: FutureBuilder<Profile>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Text(snapshot.data.name),
                Text(snapshot.data.description),
                Text(snapshot.data.genre),
                Text(snapshot.data.phoneNumber),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("Error" + snapshot.error.toString());
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
