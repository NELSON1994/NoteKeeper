import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app2/models/note.dart';
import 'package:flutter_app2/utils/database_helper.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;

  NoteDetail(this.appBarTitle); // define the constructor
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  static var _priorities = ['High', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    //controlling the back option
    return WillPopScope(
      onWillPop: () {
// when user press on the back arror of your device
        moveToLastScreen();
      },

      child: Scaffold(

        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // when user press on the back arror of your device
              moveToLastScreen();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Select the Note Rating",
                textScaleFactor: 1.8,
                textDirection: TextDirection.ltr,
              ),
              // first element as drop down button
              ListTile(
                title: DropdownButton(
                    items: _priorities.map((String dropDown) {
                      return DropdownMenuItem<String>(
                        value: dropDown,
                        child: Text(dropDown),
                      );
                    }).toList(),
                    style: textStyle,
                    value: 'Low',
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('You selected $valueSelectedByUser');
                      });
                    }),
              ),

              // second element as textfield
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint("Textfield here");
                  },
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),

              // third element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint("Textfield here");
                  },
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
// forth element

              //row wrapped in our padding
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          debugPrint("Raised Button here");
                        },
                        // color: Colors.deepPurple,
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          debugPrint("Raised Button here");
                          _neverSatisfied();
                        },
                        // color: Colors.deepPurple,
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // for back home
  void moveToLastScreen() {
    Navigator.pop(context);
  }

  //for alert dialog
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
     // barrierDismissible: false, // user must tap button!
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sure to delete the note', ),

          backgroundColor: Colors.lightGreen,
          content: SingleChildScrollView(

            child: ListBody(
              children: <Widget>[
                Text('This will be permanently removed'),
                Text('Hope you know the reparcasitions.'),
              ],
            ),
          ),
          actions: <Widget>[

                Row(
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('DELETE')),
                  Container(
                    width: 10.0,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('CANCEL',
                      )),
                ],
              ),
          ],
        );
      },
    );
  }
}
