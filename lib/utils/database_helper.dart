import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app2/models/note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton database helper

  static Database _database; //singleton Database

//table table
  String noteTable = 'note_table';

  //table columns
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';

// needs constructor to creatr the instance of the database
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // executed only once
    }
    return _databaseHelper;
  }

  //create getter for the database variable

  Future<Database> get database async {
    //singleton so apply null check
    if (_database == null) {
      _database = await initializeDb();
    }
    return _database;
  }

//function to initialize the database
  Future<Database> initializeDb() async {
    //get directory path for database store
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    //open/create the database at a given instance
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return notesDatabase;
  }

//function to create the database

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,$colDescription TEXT,$colPriority INTEGER, $colDate TEXT)');
  }

//-------------------------->>>CRUD OPERATIONS
//-------------------------->>>Fetch
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    // raw query
    // var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
//using helper functions
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');

    return result;
  }

//-------------------------->>>Insert
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

//-------------------------->>>Update
  Future<int> updateNote(Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

//-------------------------->>>Delete
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

// -------------------------->>>Get number of notes objects in the database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
