import 'package:flutter/material.dart';

class textSection extends StatelessWidget {
  final String text;
  const textSection({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                endIndent: 5,
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 30, ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
                indent: 5,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
