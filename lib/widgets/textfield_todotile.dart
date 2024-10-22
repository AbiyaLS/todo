import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Icon? prefixIcons;
  final double? fontSize;
  final EdgeInsets? contentPadding;
  final Color borderColor;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.prefixIcons,
    this.fontSize,
    this.contentPadding,
    this.borderColor = Colors.white,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        readOnly: onTap != null,
        onTap: onTap,
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: prefixIcons,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
          ),
          contentPadding: contentPadding,
        ),
      ),
    );
  }
}
