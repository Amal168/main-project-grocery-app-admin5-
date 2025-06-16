import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/Model/firebaceauthservices.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/custometextformfield.dart';
import 'package:grocery_app_admin5/MVVM/view/auth/forgot_Password_Admin.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/admin_slidBar.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  String adminEmail = 'list2localadmin@gmail.com';
  String adminpass = '123456';
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Row(
          children: [
            // Left image panel
            Container(
              width: 767,
              height: 1024,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/AdminPageImage.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),

            // Right login form
            Form(
              key: _formKey,
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
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Email field
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inria_Sans",
                                ),
                              ),
                            ),
                            h10,
                            Custometextformfield(
                              hie: 84,
                              wid: 467,
                              control: _email,
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter email";
                                }
                                return null;
                              },
                              side: 15,
                            ),
                            h10,

                            // Password field
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inria_Sans",
                                ),
                              ),
                            ),
                            h10,
                            Custometextformfield(
                              hie: 84,
                              wid: 467,
                              control: _password,
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                              side: 15,
                            ),

                            // Forgot password
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: TextButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (_) =>
                            //               const ForgotPasswordAdmin(),
                            //         ),
                            //       );
                            //     },
                            //     child: Text(
                            //       "Forgot password",
                            //       style: TextStyle(color: linktext),
                            //     ),
                            //   ),
                            // ),
                            h15,

                            // Login button
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (_email.text == adminEmail &&
                                      _password.text == adminpass) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Entered Scussefully")));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AdminSlidbar()));
                                  } else {
                                     ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Somrthing went Wrong")));
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 467,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black,
                                ),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Inria_Serif",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 15),
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
