import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

var ip = '13.232.225.28:4000';
// var ip = "10.0.2.2:4000";

FirebaseAuth auth = FirebaseAuth.instance;

Future<http.Response> addGroup(String name, String phoneNo, String description,
    String email, String genre, String college) {
  final String user = auth.currentUser.uid;
  return http.post(Uri.http(ip, 'addGroup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'phoneNo': phoneNo,
        'description': description,
        'genre': genre,
        'college': college,
        'email': email,
        'head': user,
      }));
}

Future<http.Response> joinGroup(String groupID) {
  final String user = auth.currentUser.uid;
  return http.post(Uri.http(ip, 'joinGroup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uid': user,
        'group': groupID,
      }));
}

Future<http.Response> createUser(String name, String age, String email,
    String phoneNo, String college, String genre) {
  final String uid = auth.currentUser.uid;
  return http.post(Uri.http(ip, 'addUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'uid': uid,
        'name': name,
        'age': age,
        'email': email,
        'phoneNo': phoneNo,
        'college': college,
        'genre': genre,
      }));
}

Future getUserGroup() async {
  final String uid = auth.currentUser.uid;
  var response = await http.get(Uri.http(ip, 'getUser/$uid'));
  var user = jsonDecode(response.body);
  return user;
}
