import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/custometextformfield.dart';

class ForgotPasswordAdmin extends StatefulWidget {
  const ForgotPasswordAdmin({super.key});

  @override
  State<ForgotPasswordAdmin> createState() => _ForgotPasswordAdminState();
}

class _ForgotPasswordAdminState extends State<ForgotPasswordAdmin> {
  final _email = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 767,
              height: 1024,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/360_F_492751838_Ybun2zwpQC8AZv11AwZLdXJk4cUrTt5z.jpg"),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
            ),
            // SizedBox(width: 20,),
            Form(
              key: _formkey,
              child: SizedBox(
                width: 767,
                height: 1024,
                child: Center(
                  child: Card(
                    elevation: 8,
                    child: Container(
                      width: 600,
                      height: 650,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Forgot\npassword",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Inria_Sans"),
                                )),
                            h10,
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Don’t worry ! it happens.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Inria_Sans"),
                                )),
                            h10,
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Inria_Sans"),
                                )),
                            h10,
                            Custometextformfield(
                                hie: 84,
                                wid: 467,
                                control: _email,
                                validate: (p0) {
                                  // textfield password function
                                  if (_email.text.isEmpty) {
                                    return "Please Enter Your Email";
                                  }
                                  return null;
                                },
                                side: 15),
                            h25,
                            GestureDetector(
                              onTap: () async {
                                // button function
                                if (_formkey.currentState!.validate()) {
                                  await FirebaseAuth.instance
                                      .sendPasswordResetEmail(
                                          email: _email.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Massage Has Been Scussfully Send")));
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 467,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Inria_Serif",
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
