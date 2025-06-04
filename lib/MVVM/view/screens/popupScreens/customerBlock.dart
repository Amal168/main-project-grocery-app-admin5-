import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class Customerblock extends StatelessWidget {
  String id;
  String? name;
  Customerblock({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Are You sure to Block ${name.toString() ?? " "}"),
      title: Text("Block"),
      actions: [
        MaterialButton(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: toggle2color,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Ok",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          color: redbutton,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
