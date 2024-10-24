import 'package:flutter/material.dart';

class AddtaskButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  AddtaskButton({super.key, required this.text, required this.onPressed});

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
          onPressed: onPressed,
          child: Text(
          text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
