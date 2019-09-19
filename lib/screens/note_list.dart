import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app2/models/note.dart';
import 'package:flutter_app2/utils/database_helper.dart';
import 'note_detail.dart';

class NoteList extends StatefulWidget{

int count = 0;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}
class NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  get position => null;
  @override
  Widget build(BuildContext context) {
    if(noteList == null){
      noteList = List<Note>();
    }
    return Scaffold(
          appBar: AppBar(
            title: Text(
              "Notes"
            ),
          ),
      body:  getNoteListView(),
      floatingActionButton: FloatingActionButton(
          tooltip: "You tap me to view",
          child: Icon(Icons.add_box),
          onPressed: (){
            debugPrint("Am pressed");
// navigating back to the home page
//          Navigator.push(context, MaterialPageRoute(builder:(context){
//
//            return NoteDetail();
//          } ));
          navigateToDetail('Add Note');
          }

      ),
      

    );
  }

  ListView getNoteListView() {

TextStyle textStyle = Theme.of(context).textTheme.subhead;
return ListView.builder(
  itemCount: count,
    
    itemBuilder: (BuildContext context , int podition){
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: getPriorityColor(this.noteList[position].priority),
          child: getPriorityIcon(this.noteList[position].priority),
          
        ),
        title: Text("Dummy Title", 
        //style: titleStyle,
        ),
        //subtitle: Text("Dummy Subtitle"),
        subtitle: Text(this.noteList[position].date),
        // you cannot implement an action on an icon so we use gesture dector

        trailing: GestureDetector(
          child:    Icon(Icons.delete, color:Colors.grey,),
          onTap: (){
            delete(context , noteList[podition]);
          },
        ),

      onTap: (){
          debugPrint("This is tapped");

//          Navigator.push(context, MaterialPageRoute(builder:(context){
//
//            return NoteDetail();
//          } ));
      navigateToDetail('Edit Note'); // same to the commented code,, () its implemented as a common function
      },
      ),
    );

    }
);
  }
  // return the priority color
  Color getPriorityColor(int priority){
switch(priority){
  case 1:
    return Colors.red;
  break;

  case 2:
    return Colors.yellow;
  break;

  default:
    return Colors.yellow;
}
  }
  // return the priority icon
  Icon getPriorityIcon(int priority){
    switch(priority){
      case 1:
        return Icon(Icons.play_arrow);
      break;

      case 2:
        return Icon(Icons.keyboard_arrow_right);
      break;

      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  // delete function on note
void delete(BuildContext context, Note note) async {

    int result =await databaseHelper.deleteNote(note.id);
    if(result != 0){
      _showSnackBar(context,'Note deleted Succesfully');
      // after deletion, update the listview

    }
}
//showing the snackbar with a message
void _showSnackBar(BuildContext context, String message){

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
}

  void navigateToDetail(String title){

  Navigator.push(context, MaterialPageRoute(builder:(context){

    return NoteDetail(title);
  } ));
}
//  void navigateToDetail(){
//
//    Navigator.push(context, MaterialPageRoute(builder:(context){
//
//      return NoteDetail();
//    } ));
//  }

// get map list from the database

  Future<List<Note>> getNoteList() async{
    var noteMapList = await getNoteMapList(); // get Map List


  }

  getNoteMapList() {}
}
