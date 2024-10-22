import 'package:flutter/material.dart';

class AddtaskButton extends StatelessWidget {
  const AddtaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 200,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(0xFF604CC3),
            ),
          ),
          onPressed: () {
          },
          child: Text(
            "Add Task",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
