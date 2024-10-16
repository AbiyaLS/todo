import 'package:flutter/material.dart';
import 'package:todo/widgets/text_todotile.dart';
import 'package:todo/widgets/textfield_todotile.dart';

class newTodotile extends StatelessWidget {
  const newTodotile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 25,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          textSection(
            text: "Add New Tasks",
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text("What are you planing?"),
          ),
          CustomTextField(
            borderColor: Colors.white,
            fontSize: 30,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(),
          ),
          SizedBox(height: 25),
          CustomTextField(
              borderColor: Colors.white,
              hintText: "Add Note",
              prefixIcons: Icon(
                Icons.bookmark_border,
                color: Colors.grey[500],
              )),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            hintText: "Time",
            borderColor: Colors.grey,
          ),
          SizedBox(
            height: 18,
          ),
          CustomTextField(
            hintText: "Date",
            borderColor: Colors.grey,
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF604CC3),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
