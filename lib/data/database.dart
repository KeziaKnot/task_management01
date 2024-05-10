import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase{
  List taskList = [];
  late String bio;

  //bring iin the box
  final _mybox = Hive.box('mybox');

  //first time user
  void createInitialData(){
    taskList = [
      ["Take a shower", false],
      ["Get groceries", false],
    ];
  }
  //initialbio
  void loadBio() {
    bio = _mybox.get('bio', defaultValue: '');
  }
  //update bio
  void updateBio(String newBio) {
    bio = newBio;
    _mybox.put('bio', newBio);
  }

  //load data from database
  void loadData(){
    taskList = _mybox.get("TASKLIST");
  }

  //update database
  void updateDatabase(){
    _mybox.put("TASKLIST", taskList);
  }

}