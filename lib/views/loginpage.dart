import 'package:flutter/material.dart';
import 'package:vj/firebase.dart';
import 'package:vj/views/profiles.dart';
import 'package:vj/views/signup.dart';

class LoginPageState extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<LoginPageState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "E-ORCHESTRA",
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Join The Musicians Around',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-Mail Id',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  //textColor: Colors.white,
                  // color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () async {
                    try {
                      await login(
                          emailController.text, passwordController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profiles()),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Does not have account?'),
                TextButton(
                  // textColor: Colors.blue,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpState()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ])),
    );
  }
}
