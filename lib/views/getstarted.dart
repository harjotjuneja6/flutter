import 'package:flutter/material.dart';
import 'package:vj/views/loginpage.dart';

class Getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bgimg.png"),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Get Started"),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()))
              },
            ),
          ),
        ])));
  }
}
