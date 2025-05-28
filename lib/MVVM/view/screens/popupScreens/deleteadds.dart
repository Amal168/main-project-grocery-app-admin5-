import 'package:flutter/material.dart';

class Deleteadds extends StatelessWidget {
  const Deleteadds({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Are You Sure"),
      actions: [MaterialButton(onPressed: () {
        
      },)],
    );
  }
}