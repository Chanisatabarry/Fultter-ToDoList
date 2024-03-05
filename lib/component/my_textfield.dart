import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          labelText: labelText,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}
