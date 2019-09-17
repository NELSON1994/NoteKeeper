import 'package:flutter/material.dart';

import 'note_detail.dart';

class NoteList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
  
  
  
}

class NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          backgroundColor: Colors.yellow,
          child: Icon(Icons.keyboard_arrow_right),
          
        ),
        title: Text("Dummy Title", 
        //style: titleStyle,
        ),
        subtitle: Text("Dummy Subtitle"),
        trailing: Icon(Icons.delete, color:Colors.grey,),
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
}
