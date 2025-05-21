import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/Model/firebaceauthservices.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/custometextformfield.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/admin_slidBar.dart';

class RegisterPageAdmin extends StatefulWidget {
  const RegisterPageAdmin({super.key});

  @override
  State<RegisterPageAdmin> createState() => _RegisterPageAdminState();
}

class _RegisterPageAdminState extends State<RegisterPageAdmin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Row(
          children: [
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
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Register Here",
                                style: TextStyle(
                                  fontSize: 41,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inria_Sans",
                                ),
                              ),
                            ),
                            h10,
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
                              // Add this if your Custometextformfield supports it:
                              // obscureText: true,
                            ),
                            h10,
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confirm Your Password",
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
                              control: _confirm,
                              validate: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Please confirm your password";
                                } else if (value.trim() !=
                                    _password.text.trim()) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                              side: 15,
                              // obscureText: true,
                            ),
                            h15,
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await Firebaseothsurvices().createUser(
                                      context,
                                      _email.text.trim(),
                                      _password.text.trim(),
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
                                        content: Text("Error: $e"),
                                      ),
                                    );
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
                                    "Sign up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Inria_Serif",
                                      color: Colors.white,
                                    ),
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
          ],
        ),
      ),
    );
  }
}
