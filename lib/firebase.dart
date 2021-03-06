import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<User> login(String email, String password) async {
  UserCredential result =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  final User user = result.user;
  return user;
}

Future<User> register(String email, String password) async {
  UserCredential result = await auth.createUserWithEmailAndPassword(
      email: email, password: password);
  final User user = result.user;
  return user;
}

Future<Void> logout() async {
  await auth.signOut();
  return null;
}
