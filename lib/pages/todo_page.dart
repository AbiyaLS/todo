import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:todo/pages/add_todotile.dart';
import 'package:todo/pages/menu_page.dart';
import 'package:todo/util/todo_tiles.dart';

class todoPage extends StatefulWidget {
  todoPage({super.key});

  @override
  State<todoPage> createState() => _todoPageState();
}

class _todoPageState extends State<todoPage> {
  List todoList = [
    ["make egfe", "yrehfyyr", "445/35", "7/8/8529", false],
    ["make egfe", "yrehfyyr", "445/35", "7/8/8529", false]
  ];

  // When checkBox is tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][4] = !todoList[index][4];
    });
  }

  // delete Task from each todotile

  void deleteTask(BuildContext context,int index){
    setState(() {
       todoList.removeAt(index);
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
            onPressed: () {},
            icon: Icon(
              Icons.delete_outline_rounded,
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return todoTile(
                      taskName: todoList[index][0],
                      taskNote: todoList[index][1],
                      taskTime: todoList[index][2],
                      taskDate: todoList[index][3],
                      taskCompleted: todoList[index][4],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(context, index),);
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
              todoList.add(newTask);
            });
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
