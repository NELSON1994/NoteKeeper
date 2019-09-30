import 'package:flutter/material.dart';

class Selection extends StatelessWidget {
  bool maleVal = false;
  bool femaleVal = false;
  bool bothVal = false;
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "SELECTION HERE"
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Text(
              "SELECT YOUR GENDER  :",
            ),
            Row(
                children: <Widget>[

                  Checkbox(
                      value: maleVal,
                      onChanged: (bool value){
                        setState (() {
                          maleVal = value;
                        });
                      }
                  ),
                  Text("MALE"),
                  Checkbox(
                      value: femaleVal,
                      onChanged: (bool value){
                        setState(){
                          femaleVal = value;
                        }
                      }
                  ),
                  Text("FEMALE"),

                  Checkbox(
                      value: bothVal,
                      onChanged: (bool value){
                        setState(){
                          bothVal = value;
                        }
                      }
                  ),
          Text("BOTH MALE & FEMALE"),
                ],
            ),
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}



}