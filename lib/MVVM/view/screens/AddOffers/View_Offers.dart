import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/AddOffers/Add_offers.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/AddOffers/Edit_offer.dart';

class ViewOffers extends StatefulWidget {
  final Function(Widget widget) onNavigate;
  final Function(Widget widget) onNavigate2;
  ViewOffers({super.key, required this.onNavigate, required this.onNavigate2});

  @override
  State<ViewOffers> createState() => _ViewOffersState();
}

class _ViewOffersState extends State<ViewOffers> {
  final List _Adds = [
    "assets/add1.png",
    "assets/add2.png",
    "assets/add3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: 500,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Image(
                        image: AssetImage(_Adds[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 75,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "start : 23/5/2023",
                      style: TextStyle(fontSize: 20),
                    ),
                    h30,
                    MaterialButton(
                        color: offerbutton1,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minWidth: 248,
                        height: 74,
                        onPressed: () {
                          // function for Add offer
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AddOffers()));
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ))
                  ],
                ),
                const SizedBox(
                  width: 22,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "End : 23/6/2023",
                      style: TextStyle(fontSize: 20),
                    ),
                    h30,
                    MaterialButton(
                        color: offerbutton2,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        minWidth: 248,
                        height: 74,
                        onPressed: () {
                          // function for Add offer
                          // Navigator.push(
                          //     context, MaterialPageRoute(builder: (_) => const AddOffers()));
                          widget.onNavigate(EditOffer());
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ))
                  ],
                )
              ],
            );
          },
        ),
      ),
      Positioned(
          right: 15,
          bottom: 10,
          child: MaterialButton(
            color: Colors.white,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minWidth: 100,
            height: 100,
            onPressed: () {
              // function for Add offer
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => const AddOffers()));
              widget.onNavigate2(AddOffers());
            },
            child: const Icon(
              Icons.add,
              size: 60,
            ),
          ))
    ]);
  }
}
