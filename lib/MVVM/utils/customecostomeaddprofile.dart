import 'package:flutter/material.dart';

class Customecostomeaddprofile extends StatelessWidget {
  String? Function(String?) validate;
  TextEditingController controll;
  String hint;
  Customecostomeaddprofile(
      {super.key,
      required this.validate,
      required this.controll,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controll,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
