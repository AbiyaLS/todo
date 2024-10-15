import 'package:flutter/material.dart';

class todoTile extends StatelessWidget {
  const todoTile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,

              offset: Offset(0, 4),
              blurRadius: 5,
              spreadRadius: 1
            )
          ]
        ),
        child: Center(child: Text("Orange")),
      ),
    );
  }
}
