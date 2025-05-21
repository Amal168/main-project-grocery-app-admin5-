import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';


class Soaptab extends StatefulWidget {
  const Soaptab({super.key});

  @override
  State<Soaptab> createState() => _SoaptabState();
}

class _SoaptabState extends State<Soaptab> {
  String radiobuttion = " ";
  int selectIndex = 0;
  List Soap = ["All","body Soap","Wash Soap","Shampu","Face Wash","Detgenter"];
  Color lowcolor = redbutton;
  Color highcolor = toglecolor;
  int count = 6;
  bool buttonindex=true;
  void buttoncolor(index) {
   setState(() {
      buttonindex = index!;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black26),borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Soap.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          setState(() {
                            selectIndex = index;
                          });
                        },
                        child: Text(
                          Soap[index],
                        ));
                  },
                )),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 3,
                  mainAxisExtent: 370),
              itemBuilder: (context, index) {
                switch (selectIndex) {
                  case 0:
                    return Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 118,
                            height: 121,
                            // child: Image.asset("asset/images (1).jpg",fit: BoxFit.cover,),
                            decoration: BoxDecoration(
                              image: const DecorationImage(image: AssetImage("assets/images.jpg"),fit: BoxFit.cover),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Product Name",
                            style: TextStyle(fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Only ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: count < 4 ? lowcolor : highcolor)),
                              Text("$count ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: count < 4 ? lowcolor : highcolor)),
                              Text("Left",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: count < 4 ? lowcolor : highcolor)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("100g 20Rs", style: TextStyle(fontSize: 15)),
                          const SizedBox(
                            height: 10,
                          ),
                          
                        ],
                      ),
                    );
                  case 1:
                    return const Center(
                      child: Text("No data"),
                    );
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
