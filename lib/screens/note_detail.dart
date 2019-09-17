import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle;

  NoteDetail(this.appBarTitle);// define the constructor
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }

}

class NoteDetailState extends State<NoteDetail> {
  String appBarTitle;
  static var _priorities = ['High', 'Low'];
  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();

  NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    //controlling the back option
    return WillPopScope(
        onWillPop: (){
// when user press on the back arror of your device
          moveToLastScreen();
        },
      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            // when user press on the back arror of your device
          moveToLastScreen();
          },
         ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Text("Select the Intensity",
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
                  }
              ),
            ),

            // second element as textfield
            Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Textfield here");
                },
                decoration: InputDecoration(
                  labelStyle: textStyle,
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ) ,
              ),
            ),

            // third element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint("Textfield here");
                },
                decoration: InputDecoration(
                    labelStyle: textStyle,
                    labelText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ) ,
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
                        onPressed: (){
                          debugPrint("Raised Button here");
                        },
                     // color: Colors.deepPurple,
                      color:Theme.of(context).primaryColorDark,
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
                      onPressed: (){
                        debugPrint("Raised Button here");
                      },
                      // color: Colors.deepPurple,
                      color:Theme.of(context).primaryColorDark,
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

  void moveToLastScreen() {
    
    Navigator.pop(context);
  }


}