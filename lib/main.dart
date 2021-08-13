import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notesview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hi")
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Username:"),
                  SizedBox(width: 20,),
                  Flexible(child: TextField()),
                ],
              ),
              Row(
                children: [
                  Text("Password:"),
                  SizedBox(width: 20,),
                  Flexible(child: TextField()),
                ],
              ),
              SizedBox(height: 20),
              MyButton(),
              OutlinedButton(onPressed: () {
                print("Sign up pressed");
              }, child: Text("Sign up")),
            ],
          )
        )

      )
    );
  }
}

class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NewNotesView();
          })
      );
    }, child: Text("Login"));
  }
}




