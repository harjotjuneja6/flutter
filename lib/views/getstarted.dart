import 'package:flutter/material.dart';
import 'package:vj/views/loginpage.dart';

class Getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./bgimg.png"), fit: BoxFit.cover)),
            child: Scaffold(
                body: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Get Started',
                        ),
                      ),
                      Container()
                    ])))));
  }
}
