import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

var ip = '10.0.2.2:4000';

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
