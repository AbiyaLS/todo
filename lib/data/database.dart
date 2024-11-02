import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  //reference the box

  final _mybox = Hive.box('mybox');


  void createInitialDAta() {
    todoList = [
      // ["make egfe", "yrehfyyr", "445/35", "7/8/8529", false],
      // ["make egfe", "yrehfyyr", "445/35", "7/8/8529", false]
    ];
    updateDatabase();
  }

// loading the data

void loadingData(){
    todoList=_mybox.get("TODOLIST",defaultValue: []);
}

// update the database
void updateDatabase(){
    _mybox.put("TODOLIST", todoList);
}
}