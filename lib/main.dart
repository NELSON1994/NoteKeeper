import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/loginn.dart';
import 'package:flutter_app2/screens/register.dart';
import 'package:flutter_app2/screens/note_detail.dart';
import 'package:flutter_app2/screens/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'New Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: LoginPage(),
     // home:NoteDetail(),
    );
  }

}

