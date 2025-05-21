import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';

class ShopownerProfile extends StatefulWidget {
  const ShopownerProfile({super.key});

  @override
  State<ShopownerProfile> createState() => _ShopownerProfileState();
}

class _ShopownerProfileState extends State<ShopownerProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
              height: 201,
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
                          const FittedBox(child: Text("Shop Name")),
                          h10,
                          const FittedBox(child: Text("Shop Time")),
                        ],
                      ),
                    ],
                  ),
                  
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
      ),
    );
  }
}
