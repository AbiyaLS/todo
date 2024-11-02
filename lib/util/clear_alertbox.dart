import 'package:flutter/material.dart';

class ClearAlertBox extends StatelessWidget {
  final VoidCallback onPressed;

  ClearAlertBox({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Image.asset("assets/alert.png")),
      content:
          const Text("Are you sure you want to delete all completed tasks?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(onPressed: onPressed, child: Text("Delete"))
      ],
    );
  }
}
