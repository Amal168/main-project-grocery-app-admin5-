import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 354,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      child: Image(
                          image: AssetImage("assets/dummy profile photo.jpg")),
                    ),
                    w15,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FittedBox(child: Text("Abinave")),
                        h10,
                        const FittedBox(child: Text("1234567890")),
                        h10,
                        const FittedBox(child: Text("Email@gmail.com")),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // function for back
                      Navigator.pop(context);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios_new),
                        Text("Back"),
                      ],
                    ))
              ],
            ),
          ),
        ),
        Card(
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 101,
            child: const FittedBox(child: Text("Place")),
          ),
        ),
        Card(
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 201,
            child: const FittedBox(child: Text("Location")),
          ),
        )
      ],
    );
  }
}
