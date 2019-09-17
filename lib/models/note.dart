class Note {
int _id;
String _title;
String _description;
String _date;
int _priority;


// description is optional thats y its on []
  //constructor
Note( this._date, this._priority, this._title,[this._description]);

//Named constructor in Dart
  Note.widthId( this._id,this._date, this._priority, this._title,[this._description]);


  //getters
int get id => _id;

String get title => _title;
  String get description => _description;
  int get priority => _priority;
  String get date => _date;

  // id will not have a setter because it will be generated by the system
  //setters
  set priority(int priority) {
    this._priority = priority;
  }

  set date(String date) {
   this. _date = date;
  }

  set description(String description) {
    this. _description = description;
  }

  set title(String title) {
    // you can perform your validations here
    if(title.length <= 255) {
      this._title = title;
    }
  }

// function to convert Note object into a map object
Map<String,dynamic> toMap(){

    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['descriptin'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
}

//function to extract Note object from the map object

Note.fromMapObject(Map<String,dynamic> map){
this._id = map['id'];
this._title = map['title'];
this._description = map['description'];
this._priority = map['priority'];
this._date = map['date'];
}
}