import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/customecostomeaddprofile.dart';

class Customeradd extends StatelessWidget {
   Customeradd({super.key});
  final Email=TextEditingController();
  final password=TextEditingController();
  final conferm=TextEditingController();
  final name=TextEditingController();
  final phone=TextEditingController();
  final location=TextEditingController();
  final address=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage("assets/dummy profile photo.jpg")),
          ),),
          w10,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Email",textAlign: TextAlign.left,)),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: Email, hint: "Email"),
          w10,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Password")),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: password, hint: "Password"),
          w10,
          Text("Conferm Password"),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: conferm, hint: "Conferm Password"),
          w10,
          Text("Name"),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: name, hint: "Name"),
          w10,
          Text("Phone"),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: phone, hint: "Phone"),
          w10,
          Text("Location"),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: location, hint: "Location"),
          w10,
          Text("Address"),
          Customecostomeaddprofile(validate: (p0) {
            
          }, controll: address, hint: "Address"),
        ],
      ),
      actions: [
        MaterialButton(onPressed: () {
          // Add customer
        },child: Text("Submit",style:TextStyle(fontWeight: FontWeight.bold) ,),),
         MaterialButton(onPressed: () {
          // cancel add customer
        },child: Text("Cancel",style:TextStyle(fontWeight: FontWeight.bold) ,),)
      ],
    );
  }
}