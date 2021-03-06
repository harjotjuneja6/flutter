import 'package:flutter/material.dart';
import 'package:vj/views/logout.dart';
//import 'package:vj/views/detailed.dart';

class Profiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: //Container<Widget>(Text('List Of Members'),
                Container(
                    alignment: Alignment.topRight,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      //textColor: Colors.white,
                      // color: Colors.blue,
                      child: Text('LogOut'),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogOutPage()),
                        )
                      },
                    ))));
  }
}
