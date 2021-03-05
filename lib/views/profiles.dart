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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogOutPage()),
                      );
                    },
                  )),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children:[
              for(var i = 0; i < 5; i++)
                {
                  Container(
                      //Container(
                      child: Row(children: <Widget>[
                    new Container(
                      //width: 25,
                      //height: 20,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: new Image.network(
                        'https://images.pexels.com/photos/1525043/pexels-photo-1525043.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=45&w=45',
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(left: 40, bottom: 10, top: 5),
                        child: Row(children: <Widget>[
                          new Container(
                            alignment: Alignment.topLeft,
                            child: new Column(
                              children: <Widget>[
                                new Text('HSJ'),
                                new Text('Harmonium and tabla')
                              ],
                            ),
                          ), //Text("Hello! I am in the container jfhjbhhd",
                          //style: TextStyle(fontSize: 16)),
                        ])),
                      
                  ])),
                }
            ]));
  }
}
