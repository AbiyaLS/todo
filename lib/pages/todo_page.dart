import 'package:flutter/material.dart';
import 'package:todo/pages/add_todotile.dart';
import 'package:todo/util/todo_tiles.dart';

class todoPage extends StatelessWidget {
  const todoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 80.0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_sharp,
              size: 35,
            )),
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
              child: ListView(
                children: [
                  todoTile(),
                  todoTile(),
                  todoTile(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => newTodotile()));
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
