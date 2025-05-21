import 'package:flutter/material.dart';

class Custometextformfield extends StatelessWidget {
  double wid;
  double hie;
  TextEditingController control;
  String? Function(String?)? validate;
  double side;
  Custometextformfield(
      {super.key,
      required this.hie,
      required this.wid,
      required this.control,
      required this.validate,
      required this.side});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: control,
      validator: validate,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(side))),
    );
  }
}
