import 'package:flutter/material.dart';
//import 'package:vj/views/profiles.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "                        Details",
          ),
        ),
        body: Column(children: <Widget>[
          Container(
              child: Row(children: <Widget>[
            new Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'name',
                  style: TextStyle(fontSize: 20),
                ))
          ])),
          new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'phone no',
                style: TextStyle(fontSize: 20),
              ))
        ]));
  }
}
