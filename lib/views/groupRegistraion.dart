import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vj/views/DBQueries.dart';
import 'package:vj/views/profiles.dart';

class GroupRegistration extends StatefulWidget {
  @override
  _GroupRegistrationState createState() => _GroupRegistrationState();
}

class _GroupRegistrationState extends State<GroupRegistration> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genreController = TextEditingController();
  final phoneNoController = TextEditingController();
  final desciptionController = TextEditingController();
  String college = "LNCT";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Group Registration")),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Name"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: genreController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Genre"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Phone"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: desciptionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Desciption"),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "College",
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: DropdownButton(
                        hint: Text(college),
                        onChanged: (String newValue) {
                          setState(() {
                            college = newValue;
                          });
                        },
                        items: <String>['LNCT', 'LNCTE', 'LNCTS']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () async {
                      await addGroup(
                          nameController.text,
                          phoneNoController.text,
                          desciptionController.text,
                          emailController.text,
                          genreController.text,
                          college);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profiles()));
                    },
                    child: Center(
                      child: Text("Submit"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
