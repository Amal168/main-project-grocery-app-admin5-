import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Shopowneradd extends StatefulWidget {
  const Shopowneradd({super.key});

  @override
  State<Shopowneradd> createState() => _CustomeraddState();
}

class _CustomeraddState extends State<Shopowneradd> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final addressController = TextEditingController();
  final shoptimeController = TextEditingController();
  final shopnameController = TextEditingController();

  bool isLoading = false;

  Future<void> _addCustomer() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      // 1. Create user in Firebase Auth
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final newUser = userCredential.user;

      // 2. Add user profile to Firestore
      if (newUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(newUser.uid)
            .set({
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'place': addressController.text.trim(),
          'email': emailController.text.trim(),
          'location': locationController.text.trim(),
          'shoptime': shoptimeController.text.trim(),
          'shopname': shopnameController.text.trim(),
          'role': 'ShopOwner',
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Shopowner added successfully")),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: inputType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$label is required";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text("Add New Shopowner", style: TextStyle(fontWeight: FontWeight.bold)),
      content: SizedBox(
        width: 400,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/dummy profile photo.jpg"),
                ),
                const SizedBox(height: 16),

                _buildTextField(
                    label: "Email",
                    controller: emailController,
                    inputType: TextInputType.emailAddress),
                _buildTextField(
                    label: "Password",
                    controller: passwordController,
                    isPassword: true),
                _buildTextField(
                    label: "Confirm Password",
                    controller: confirmController,
                    isPassword: true),
                _buildTextField(label: "Name", controller: nameController),
                _buildTextField(label: "shopname", controller: shopnameController),
                _buildTextField(label: "shoptime", controller: shoptimeController),
                _buildTextField(
                    label: "Phone",
                    controller: phoneController,
                    inputType: TextInputType.phone),
                    
                _buildTextField(label: "Location", controller: locationController),
                _buildTextField(label: "Address", controller: addressController),
              ],
            ),
          ),
        ),
      ),
      actions: [
        if (isLoading)
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          )
        else ...[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: _addCustomer,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text("Submit", style: TextStyle(fontSize: 16)),
            ),
          ),
        ]
      ],
    );
  }
}
