import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/AddOffers/View_Offers.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/Comments_And_Retings/Comments_And_Ratings.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/Customer/customer_list.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/shopOwner_list.dart';

class AdminSlidbar extends StatefulWidget {
  const AdminSlidbar({super.key});

  @override
  State<AdminSlidbar> createState() => _AdminSlidbarState();
}

class _AdminSlidbarState extends State<AdminSlidbar> {
  Widget? _overrideWidget;

  final List<Widget> _adminpage = [];

  @override
  void initState() {
    super.initState();
    _adminpage.addAll([
      const Center(child: Text("Dashboard")),
      CustomerList(
        onNavigate: (widget) {
          setState(() {
            _overrideWidget = widget;
          });
        },
      ),
      ShopownerList(
        onNavigate: (widget) {
          setState(() {
            _overrideWidget = widget;
          });
        },
        onNavigate2: (widget) {
          setState(() {
            _overrideWidget = widget;
          });
        },
      ),
      const CommentsAndRatings(),
      ViewOffers(
        onNavigate: (widget) {
          setState(() {
            _overrideWidget = widget;
          });
        },
        onNavigate2: (widget) {
          setState(() {
            _overrideWidget = widget;
          });
        },
      ),
    ]);
  }

  int _selectedindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedindex = index;
      _overrideWidget = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border.all(),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage:
                  AssetImage("assets/Screenshot 2025-03-26 131955.png"),
            ),
            SizedBox(width: 8),
            Text(
              "List2Local",
              style: TextStyle(
                fontFamily: "Inria_Sans",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Admin Name"),
                    Text("Administrator", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                w10,
                const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage("assets/dummy profile photo.jpg"),
                ),
              ],
            ),
          ),
          w15
        ],
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Container(
            width: 150,
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                ...List.generate(5, (index) {
                  final List<String> labels = [
                    "Dashboard",
                    "CUSTOMER",
                    "SHOPS",
                    "COMMENTS\nRATINGS",
                    "ADD \n OFFERS"
                  ];
                  final List<Widget> icons = [
                    const Icon(Icons.dashboard, size: 40),
                    const Image(image: AssetImage("assets/cuotomericpn.png"), width: 30),
                    const Image(image: AssetImage("assets/shopicon.png"), width: 30),
                    const Image(image: AssetImage("assets/commentratingicon.png"), width: 30),
                    const Image(image: AssetImage("assets/offericon.png"), width: 30),
                  ];

                  return GestureDetector(
                    onTap: () => _selectpage(index),
                    child: Card(
                      color: Colors.white,
                      elevation: _selectedindex == index ? 10 : 0,
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            icons[index],
                            const SizedBox(height: 10),
                            Text(labels[index], textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: _overrideWidget ?? _adminpage[_selectedindex],
          ),
        ],
      ),
    );
  }
}
