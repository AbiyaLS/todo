import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcons;
  final double? fontSize;
  final EdgeInsets? contentPadding;

  const customTextfield({super.key,
    this.hintText,
    this.prefixIcons,
    this.fontSize,
  this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: prefixIcons,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),


          ),
          contentPadding: contentPadding
        ),
      ),
    );
  }
}
