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
        children: [
          SizedBox(height: 30),
          textSection(
            text: "Add New Tasks",
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("What are you planing?"),
          ),
          customTextfield(
            fontSize: 30,
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Divider(),
          ),
          SizedBox(height: 25),
          customTextfield(
              hintText: "Add Note",
              prefixIcons: Icon(
                Icons.bookmark_border,
                color: Colors.grey[500],
              ))
        ],
      ),
    );
  }
}
