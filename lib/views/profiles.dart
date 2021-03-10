import 'package:flutter/material.dart';
import 'package:vj/firebase.dart';
import 'package:vj/views/loginpage.dart';
import 'package:vj/views/logout.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//import 'package:vj/views/detailed.dart';

Future<List<Profile>> fetchProfile() async {
  final response = await http.get(Uri.http('13.232.225.28:4000', 'getGroups'));
  if (response.statusCode == 200) {
    List<Profile> profiles;
    profiles = (jsonDecode(response.body) as List)
        .map((i) => Profile.fromJson(i))
        .toList();
    return profiles;
  } else {
    throw Exception("Failed to Load");
  }
}

class Profile {
  final String name;
  final String description;
  final String phoneNumber;
  final String genre;
  final String city;

  Profile(
      {this.name, this.city, this.description, this.genre, this.phoneNumber});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json['name'],
        description: json['description'],
        genre: json['genre'],
        phoneNumber: json['phoneNo'],
        city: json["city"]);
  }
}

class Profiles extends StatefulWidget {
  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  Future<List<Profile>> futureProfile;

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
            onPressed: () async {
              await logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPageState()));
            },
          ),
        ),
      ),
      body: FutureBuilder<List<Profile>>(
        future: futureProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Widget> list = [];
            for (var profile in snapshot.data) {
              list.add(Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                          color: Colors.blue.withOpacity(.2))
                    ]),
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Text(profile.name),
                      Text(profile.description),
                      Text(profile.genre),
                      // Text(profile.city),
                      Text(profile.phoneNumber),
                    ],
                  ),
                ),
              ));
            }
            return Column(
              children: list,
            );
          } else if (snapshot.hasError) {
            return Text("Error" + snapshot.error.toString());
          }
          return Container(child: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
