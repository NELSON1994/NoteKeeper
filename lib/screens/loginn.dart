import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/register.dart';

import 'note_detail.dart';

class LoginPage extends StatelessWidget {
  final _pinCodeController = TextEditingController();
  final emailController = TextEditingController();

  BuildContext get context => null;


  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('assets/images/login.jpg',
      width: 600.0,height: 50.0,);
    final emailInput = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      // maxLength: 100,// maximum no of element in the field
      maxLines: 1,//maximum no of lines
      autocorrect: false,//no autocorrect allowed
      autofocus: true,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 20.0,
      ),
      onChanged: (value) {
        debugPrint("Textfield here");
      },
      decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          hintText: 'nelson62moses@gmail.com',
          labelText: 'User Email Address',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
    );
    final pinCode = TextFormField(
      controller: _pinCodeController,
      keyboardType: TextInputType.phone,
      // maxLength: 4,
      obscureText: true, //for hiding text to invisible(for Passwords)
      maxLines: 1,
      autocorrect: false,
      autofocus: true,

      style: TextStyle(
        color: Colors.black87,
        fontSize: 20.0,
      ),
      onChanged: (value) {
        debugPrint("Textfield here");
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.white,
          ),
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          labelText: 'User Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
    );
    final buttons = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton.icon(

              onPressed: (){
                debugPrint("Raised Button here");
                notesListNavigation(context, "Add Note");
              },
              icon: Icon(
                  Icons.loupe
              ),
              // color: Colors.deepPurple,
              // color:Theme.of(context).primaryColorDark,
              color: Colors.blue,
              textColor: Theme.of(context).primaryColorLight,

              label: Text(
                'SIGN IN',
                //textScaleFactor: 1.5,
              ),
            ),
          ),
          Container(
            width: 3.0,
          ),
          Expanded(
            child: RaisedButton.icon(
              onPressed: (){
                debugPrint("Raised Button here");
                registerNavigation(context);
              },
              // color: Colors.deepPurple,
              //color:Theme.of(context).primaryColorDark,
              color: Colors.blue,
              textColor: Theme.of(context).primaryColorLight,
              label: Text(
                'SIGN UP',
                //textScaleFactor: 1.5,
              ),
              icon: Icon(
                  Icons.person_pin
              ),
            ),
          )
        ],
      ),
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALKAIDA APPLICATION",
          style: TextStyle(
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      //for the drawer
      drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
               Container(
              child: DrawerHeader(
                child: Text('ALKAIDA APPLICATION'
                  , style: TextStyle(fontSize: 25.0,),),
                decoration: BoxDecoration(
                  color: Colors.blue,

                ),
                padding: EdgeInsets.only(top: 1.0),
              ),
                height: 90.0,

          ),

              ListTile(
                leading: Icon(Icons.home,color: Colors.blue,),
                title: Text('HOME'
                  , style: TextStyle(fontSize: 20.0,),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
                selected: true,
              ),
              ListTile(
                leading: Icon(Icons.add_comment,color: Colors.blue,),
                title: Text('REGISTER'
                  , style: TextStyle(fontSize: 20.0,),),
//                onTap: () {
//                  // Update the state of the app
//                  // ...
//                  // Then close the drawer
//                  Navigator.pop(context);
//                },
              onTap:() {registerNavigation(context);},

                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              ),
              ListTile(
                leading: Icon(Icons.album,color: Colors.blue,),
                title: Text('LOG IN'
                  , style: TextStyle(fontSize: 20.0,),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              ),

              ListTile(
                leading: Icon(Icons.border_all,color: Colors.blue,),
                title: Text('ABOUT US'
                  , style: TextStyle(fontSize: 20.0,),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              ),
              ListTile(
                leading: Icon(Icons.phone,color: Colors.blue,),
                title: Text('CONTACT US'
                  , style: TextStyle(fontSize: 20.0,),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              ),
              ListTile(
                leading: Icon(Icons.help,color: Colors.blue,),
                title: Text('HELP'
                , style: TextStyle(fontSize: 20.0,),),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
                trailing: Icon(Icons.keyboard_arrow_right,color: Colors.blue,),
              ),
            ],
          ),
        ),
      backgroundColor: Colors.lightGreen,
      body: Center(

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0,),
              child: Text(
                'LOG IN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 5.0,
            ),

            logo,
            Container(
              height: 7.0,
            ),
            emailInput,
            Container(
              height: 10.0,
            ),
            pinCode,
            Container(
              height: 10.0,
            ),
            buttons

          ],
        ),
      ),
    );
  }

  void registerNavigation(BuildContext context){

    Navigator.push(context, MaterialPageRoute(builder:(context){

      return RegisterPage();
    } ));
  }


  void notesListNavigation(BuildContext context,String title){

    Navigator.push(context, MaterialPageRoute(builder:(context){

      return NoteDetail(title);
    } ));
  }
}


