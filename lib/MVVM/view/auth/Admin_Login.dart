import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/Model/firebaceauthservices.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/custometextformfield.dart';
import 'package:grocery_app_admin5/MVVM/view/auth/Register_page_admin.dart';
import 'package:grocery_app_admin5/MVVM/view/auth/forgot_Password_Admin.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/admin_slidBar.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/sideadmin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
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
                              // obscureText: true, // Add this if supported
                            ),

                            // Forgot password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const ForgotPasswordAdmin(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot password",
                                  style: TextStyle(color: linktext),
                                ),
                              ),
                            ),
                            h15,

                            // Login button
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await Firebaseothsurvices().signin(
                                      context,
                                      _email.text.trim(),
                                      _password.text.trim(),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "Successfully logged in. Welcome!"),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const AdminSlidbar(),
                                      ),
                                    );
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Login failed: $e"),
                                      ),
                                    );
                                    print(e);
                                  }
                                }
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (_) => AdminSlidbar()));
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
                            h15,

                            // Google login button
                            GestureDetector(
                              onTap: () async {
                                await Firebaseothsurvices()
                                    .googlesignin(context);
                              },
                              child: SizedBox(
                                height: 71,
                                width: 78,
                                child: Image.asset(
                                  "assets/google-icon-logo-symbol-free-png.webp",
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
