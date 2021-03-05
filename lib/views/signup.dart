import 'package:flutter/material.dart';
import 'package:vj/views/loginpage.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail Id',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact No.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Profession ',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    //textColor: Colors.white,
                    // color: Colors.blue,
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  )),
            ])));
  }
}
