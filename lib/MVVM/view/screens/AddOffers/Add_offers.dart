import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:image_picker/image_picker.dart';

class AddOffers extends StatefulWidget {
  const AddOffers({super.key});

  @override
  State<AddOffers> createState() => _AddOffersState();
}

class _AddOffersState extends State<AddOffers> {
  final _formKey = GlobalKey<FormState>();
  String selectedStartDate = "2025-02-25";
  String selectedEndDate = "2025-02-27";
  final TextEditingController _titleController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    DateTime initialDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          selectedStartDate = picked.toString().split(' ')[0];
        } else {
          selectedEndDate = picked.toString().split(' ')[0];
        }
      });
    }
  }

  File? _image;
  String? _imageUrl;

  Future pickimage(ImageSource source) async {
    final imagefile = await ImagePicker().pickImage(source: source);
    if (imagefile != null) {
      setState(() {
        _image = File(imagefile.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Select  Image"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Take from camera"),
              onTap: () {
                Navigator.pop(context);
                pickimage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from gallery"),
              onTap: () {
                Navigator.pop(context);
                pickimage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              elevation: 12,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _image != null
                          ? Image.file(
                              _image!,
                              width: 350,
                              height: 250,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "assets/add3.jpg",
                              width: 350,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton.icon(
                      onPressed:
                          _showImagePickerDialog, 
                      icon: const Icon(Icons.image_outlined),
                      label: const Text("Add Image"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple,
                        backgroundColor: Colors.white,
                        elevation: 5,
                        side: const BorderSide(color: Colors.grey),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            h30,

            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Offer Title',
                hintText: 'Enter offer title ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: const Icon(Icons.title),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter an offer title';
                }
                return null;
              },
            ),
            h30,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Starting Date",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => _selectDate(context, true),
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: Text(
                        selectedStartDate,
                        style: const TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 8,
                        minimumSize: const Size(250, 60),
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ending Date",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () => _selectDate(context, false),
                      icon: const Icon(Icons.calendar_today_outlined),
                      label: Text(
                        selectedEndDate,
                        style: const TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 8,
                        minimumSize: const Size(250, 60),
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            h30,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _formKey.currentState!.reset();
                    _titleController.clear();
                    setState(() {
                      _image = null;
                    });
                  },
                  icon: const Icon(Icons.close),
                  label: const Text("Reject", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: offerbutton1,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // add offer
                        await FirebaseFirestore.instance
                            .collection('offers')
                            .add({
                          'title': _titleController.text.trim(),
                          'startingDate': selectedStartDate,
                          'endingDate': selectedEndDate,
                          'timestamp': FieldValue
                              .serverTimestamp(), 
                          // 'imagePath': _image?.path ??
                          //     '', 
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Offer Sent Successfully")),
                        );

                        _formKey.currentState!.reset();
                        _titleController.clear();
                        setState(() {
                          _image = null;
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to send offer: $e")),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.send),
                  label: const Text("Send", style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: toggle2color,
                    foregroundColor: Colors.white,
                    elevation: 10,
                    minimumSize: const Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
