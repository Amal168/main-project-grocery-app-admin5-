import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Firebaseothsurvices {
  // create a auth as instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create a function for signin
  Future<void> signin(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    } catch (e) {
      // Handle other errors (non-Firebase related)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unexpected error: $e")),
      );
    }
  }

  Future<void> createUser(BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unexpected error: $e")),
      );
    }
  }
  //create a funtion for Google Signin
  Future<UserCredential?> googlesignin(BuildContext context) async {
    try {
      GoogleSignInAccount? gooleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? userauth =
          await gooleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userauth?.accessToken, idToken: userauth?.accessToken);
      return _auth.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Something Wrong")));
    }
    return null;
  }

  // create a function for signout

  Future<void> signOut() async {
    _auth.signOut();
  }
}

