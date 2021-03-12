import 'package:flutter/material.dart';
import 'package:vj/firebase.dart';
import 'package:vj/views/DBQueries.dart';
import 'package:vj/views/loginpage.dart';

class SignUpState extends StatefulWidget {
  @override
  SignUp createState() => SignUp();
}

class SignUp extends State<SignUpState> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();
  final ageController = TextEditingController();
  final genreController = TextEditingController();
  final nameController = TextEditingController();
  final collegeController = TextEditingController();
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
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-Mail Id',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: genreController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'genre',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: collegeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'college',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: phoneNoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contact No.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: ageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'age ',
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
                    onPressed: () async {
                      try {
                        await register(
                            emailController.text, passwordController.text);
                        await createUser(
                            nameController.text,
                            ageController.text,
                            emailController.text,
                            phoneNoController.text,
                            collegeController.text,
                            genreController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPageState()),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                  )),
            ])));
  }
}
