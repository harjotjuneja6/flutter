import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vj/views/DBQueries.dart';

//import 'package:vj/views/profiles.dart';
// var ip = "10.0.2.2:4000";
var ip = '13.232.225.28:4000';

Future<Profile> fetchProfile(String groupID) async {
  final response = await http.get(Uri.http(ip, 'getGroup/$groupID'));
  if (response.statusCode == 200) {
    Profile profile = Profile.fromJson(json.decode(response.body));
    return profile;
  } else {
    throw Exception("Failed to Load");
  }
}

class Profile {
  final String name;
  final String description;
  final String phoneNO;
  final String college;
  final String genre;
  final String email;
  final String coverURL;

  Profile(
      {this.name,
      this.description,
      this.phoneNO,
      this.college,
      this.email,
      this.coverURL,
      this.genre});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        name: json['name'],
        description: json['description'],
        genre: json['genre'],
        phoneNO: json['phoneNo'],
        college: json['college'],
        email: json['email']);
  }
}

class ProfileDetail extends StatefulWidget {
  ProfileDetail({@required this.groupID});
  final groupID;
  @override
  _ProflieDetail createState() => _ProflieDetail();
}

class _ProflieDetail extends State<ProfileDetail> {
  Future<Profile> profile;
  Future<String> group;
  @override
  void initState() {
    super.initState();
    profile = fetchProfile(widget.groupID);
    group = checkGroup();
  }

  Future<String> checkGroup() async {
    var userGroup = await getUserGroup();
    return userGroup['group'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
        ),
      ),
      body: Container(
        child: FutureBuilder<Profile>(
          future: profile,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data.name),
                  Text(snapshot.data.college),
                  Text(snapshot.data.phoneNO),
                  Text(snapshot.data.email),
                  Text(snapshot.data.genre),
                  Text(snapshot.data.description),
                  ElevatedButton(
                    onPressed: () async {
                      await joinGroup(widget.groupID);
                    },
                    child: FutureBuilder(
                      future: group,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data == widget.groupID
                              ? "Already Joined"
                              : "Join Now");
                        } else if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text("Cannot Fetch");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                'Error',
                textDirection: TextDirection.ltr,
              );
            }
            return Container(child: Center(child: CircularProgressIndicator()));
          },
        ),
      ),
    );
  }
}
