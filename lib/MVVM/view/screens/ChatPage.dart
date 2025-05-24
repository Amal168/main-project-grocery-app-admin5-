import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class Chatpage extends StatefulWidget {

  const Chatpage({super.key,});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final TextEditingController chatController = TextEditingController();

  void sendMessage() {
    if (chatController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enter some messages")),
      );
    } else {
      print("Message Sent: ${chatController.text}");
      chatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatbackground,
      appBar: AppBar(
        backgroundColor: toggle2color,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: const Icon(
            Icons.keyboard_return,
            color: Colors.white,
          ),
          iconSize: 35,
        ),
        title: const Row(
          children: [
            CircleAvatar(
                // radius: 25,
                ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Customer Name",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Calling Customer")));
              });
            },
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            iconSize: 35,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Container()), // Chat messages will go here
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.transparent,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 311,
                      height: 50,
                      child: TextField(
                        controller: chatController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: const Icon(Icons.camera_alt),
                          hintText: "Type a message...",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
