import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class shopownerblock extends StatelessWidget {
  String id;
  String? name;
  shopownerblock({super.key, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Are You sure to Block ${name.toString() ?? " "}"),
      title: Text("Block"),
      actions: [
        MaterialButton(
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
