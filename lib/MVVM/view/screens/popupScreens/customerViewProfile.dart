import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class Customerviewprofile extends StatelessWidget {
  String? name;
  String? Email;
  String? phone;
  String? location;
  String? address;
  Customerviewprofile({
    super.key,
    required this.name,
    required this.Email,
    required this.phone,
    required this.location,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage("assets/dummy profile photo.jpg"))),
          ),
          Text(name.toString()??""),
          Text(Email.toString()??""),
          Divider(),
          Text(phone.toString()??""),
          Text(location.toString()??""),
          Text(address.toString()??""),
        ],
      ),
    );
  }
}
