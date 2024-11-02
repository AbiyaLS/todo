import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/data/database.dart';
import 'package:todo/pages/add_todotile.dart';
import 'package:todo/pages/menu_page.dart';
import 'package:todo/util/clear_alertbox.dart';
import 'package:todo/util/todo_tiles.dart';

class todoPage extends StatefulWidget {
  todoPage({super.key});

  @override
  State<todoPage> createState() => _todoPageState();
}

class _todoPageState extends State<todoPage> {
  bool isEmpty = false;

  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialDAta();
      db.updateDatabase();
    } else {
      db.loadingData();
    }
    _updateEmptyState();
  }

  // When checkBox is tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][4] = !db.todoList[index][4];
    });
    db.updateDatabase();
  }

  // delete Task from each todoTile
  void deleteTask(BuildContext context, int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
    _updateEmptyState();
  }

  void _updateEmptyState() {
    setState(() {
      isEmpty = db.todoList.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 80.0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_sharp,
                size: 35,
              ));
        }),
        actions: [
          IconButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return ClearAlertBox(
                    onPressed: () {
                      setState(() {
                        db.todoList.clear();
                        db.updateDatabase();
                      });
                      _updateEmptyState();
                    },
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              size: 35,
            ),
          ),
        ],
      ),
      drawer: MenuPage(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "My Tasks",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
            ),
            child: Divider(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: isEmpty
                ? Center(
                    child:
                        Container(constraints: BoxConstraints(
                          maxWidth: 250,  // Max width for the animation
                          maxHeight: 300, // Max height for the animation
                        ),child: Lottie.asset("assets/loading.json")),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: db.todoList.length,
                      itemBuilder: (context, index) {
                        return TodoTile(
                          taskName: db.todoList[index][0],
                          taskNote: db.todoList[index][1],
                          taskTime: db.todoList[index][2],
                          taskDate: db.todoList[index][3],
                          taskCompleted: db.todoList[index][4],
                          onChanged: (value) => checkBoxChanged(value, index),
                          deleteFunction: (context) =>
                              deleteTask(context, index),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => newTodotile()));
          // if newTAsk is not null, add to the todoList
          if (newTask != null) {
            setState(() {
              db.todoList.add(newTask);
            });
            db.updateDatabase();
            _updateEmptyState();
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF604CC3),
        elevation: 15,
      ),
    );
  }
}
