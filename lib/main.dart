import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/loginn.dart';
import 'package:flutter_app2/screens/register.dart';
import 'package:flutter_app2/screens/note_detail.dart';
import 'package:flutter_app2/screens/note_list.dart';
import 'package:flutter_app2/screens/selections.dart';
import 'package:flutter_app2/screens/stepper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Alkaida Application',
      debugShowCheckedModeBanner: false,//REMOVE THE DEBUG FROM APP
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: LoginPage(),
     // home:NoteDetail(),
      //home: Selection(),
     // home: MyHomePage(),
    );
  }

}

