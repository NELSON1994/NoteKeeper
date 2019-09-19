import 'package:flutter/material.dart';

import 'note_detail.dart';

class LoginPage extends StatelessWidget {
  final _pinCodeController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final conController = TextEditingController();
  final phoneController = TextEditingController();

  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('assets/images/login.jpg',
      width: 600.0,height: 50.0,);
//    CircleAvatar(
//      backgroundColor: Colors.white,
//      child: Image.asset('assets/images/login.jpg',
//      width: 600.0,height: 50.0,),
//    );

    final pinCode = TextFormField(
      controller: _pinCodeController,
      keyboardType: TextInputType.phone,
     // maxLength: 4,
      obscureText: true, //for hiding text to invisible(for Passwords)
      maxLines: 1,
      autocorrect: false,
      autofocus: true,

      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 20.0,
      ),
      onChanged: (value) {
        debugPrint("Textfield here");
      },
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
          ),
          labelStyle: TextStyle(
            color: Colors.orange,
          ),
          labelText: 'Enter Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
    );
    final nameInput = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextField(
        cursorColor: Colors.deepOrange,
        controller: nameController,
        maxLines: 1,
        readOnly: false,
        //initialValue: 'Nelson Moses Otieno',
       // maxLength: 30,

        keyboardType: TextInputType.text,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20.0,
        ),
        onChanged: (value) {
          debugPrint("Textfield here");
        },
        decoration: InputDecoration(
         // prefixText: 'Ne',
            prefixIcon: Icon(
              Icons.note,
            ),
            hintText: 'Crainneillar Fambler',
            labelStyle: TextStyle(
              color: Colors.orange,
            ),
            labelText: 'Enter Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
      ),
    );

    final phoneInput = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextField(
        cursorColor: Colors.deepOrange,
        controller: phoneController,
        maxLines: 1,
        readOnly: false,
        //initialValue: 'Nelson Moses Otieno',
        // maxLength: 30,

        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20.0,
        ),
        onChanged: (value) {
          debugPrint("Textfield here");
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
            ),
           prefixText: '+254',
            labelStyle: TextStyle(
              color: Colors.orange,
            ),
            hintText: '718826344',
            labelText: 'Enter Phone Number',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
      ),
    );
    final conInput = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: TextField(
        cursorColor: Colors.deepOrange,
        controller: conController,
        obscureText: true, //for hiding text to invisible(for Passwords)
        maxLines: 1,
        // maxLength: 30,

        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 20.0,
        ),
        onChanged: (value) {
          debugPrint("Textfield here");
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
            ),
            labelStyle: TextStyle(
              color: Colors.orange,
            ),
            labelText: 'Confirm Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            )
        ),
      ),
    );
    final emailInput = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
     // maxLength: 100,// maximum no of element in the field
      maxLines: 1,//maximum no of lines
      autocorrect: false,//no autocorrect allowed
      autofocus: true,
      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 20.0,
      ),
      onChanged: (value) {
        debugPrint("Textfield here");
      },
      decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.orange,
          ),
          prefixIcon: Icon(
            Icons.email,
          ),
          hintText: 'nelson62moses@gmail.com',
          labelText: 'Enter Email Address',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)
          )
      ),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          onPressed: () {
            navigateToDetail('');
          },
          padding: EdgeInsets.all(12.0),
          color: Colors.white,
          child: Text(
            'SIGN UP',
            style: TextStyle(color: Colors.deepOrange),
          ),
        ));

    final buttons = Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton.icon(

              onPressed: (){
                debugPrint("Raised Button here");
              },
              icon: Icon(
                Icons.loupe
              ),
              // color: Colors.deepPurple,
             // color:Theme.of(context).primaryColorDark,
              color: Colors.blue,
              textColor: Theme.of(context).primaryColorLight,

              label: Text(
                'SIGN UP',
                textScaleFactor: 1.5,
              ),
            ),
          ),
          Container(
            width: 5.0,
          ),
          Expanded(
            child: RaisedButton.icon(
              onPressed: (){
                debugPrint("Raised Button here");
              },
              // color: Colors.deepPurple,
              //color:Theme.of(context).primaryColorDark,
              color: Colors.blue,
              textColor: Theme.of(context).primaryColorLight,
              label: Text(
                'SIGN IN',
                textScaleFactor: 1.5,
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
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0,),
              child: Text(
                'REGISTER  PAGE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.orange,
                ),
              ),
            ),
            Container(
              width: 5.0,
            ),
            logo,

            nameInput,
            phoneInput,
            emailInput,
            Container(
              height: 10.0,
            ),
            pinCode,
            conInput,
            //loginButton
            buttons

          ],
        ),
      ),
    );
  }

  void navigateToDetail(String title){

    Navigator.push(context, MaterialPageRoute(builder:(context){

      return NoteDetail(title);
    } ));
  }
}
