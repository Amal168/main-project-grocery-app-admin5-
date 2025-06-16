import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/view/auth/Admin_Login.dart';
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
    // Colors
    final Color sidebarBackground = Colors.blueGrey.shade900;
    final Color selectedColor = Colors.lightBlueAccent.shade100;
    final Color iconColor = Colors.white70;
    final Color selectedIconColor = Colors.blue.shade700;
    final TextStyle labelStyle = TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0.8,
    );
    final TextStyle selectedLabelStyle = TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w700,
      fontSize: 15,
      letterSpacing: 0.9,
    );

    final List<String> labels = [
      "Dashboard",
      "Customer",
      "Shops",
      "Comments & Ratings",
      "Add Offers"
    ];
    final List<Widget> icons = [
      const Icon(Icons.dashboard_outlined, size: 28),
      Image.asset("assets/cuotomericpn.png", width: 26, color: iconColor),
      Image.asset("assets/shopicon.png", width: 26, color: iconColor),
      Image.asset("assets/commentratingicon.png", width: 26, color: iconColor),
      Image.asset("assets/offericon.png", width: 26, color: iconColor),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        backgroundColor: Colors.white,
        shape: Border.all(color: Colors.grey.shade300),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage:
                  AssetImage("assets/Screenshot 2025-03-26 131955.png"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(width: 12),
            Text(
              "List2Local",
              style: TextStyle(
                fontFamily: "Inria_Sans",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage("assets/dummy profile photo.jpg"),
                        ),
                        Text(
                          "AMAL.S",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "Administrator",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Divider(),
                        MaterialButton(
                          color: redbutton,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Are You Sure",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                  actions: [
                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(redbutton),foregroundColor:WidgetStatePropertyAll(Colors.white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel")),
                                    ElevatedButton(
                                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(greenbutton),foregroundColor:WidgetStatePropertyAll(Colors.white) ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AdminLogin()));
                                        },
                                        child: Text("Ok"))
                                  ],
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              w15,
                              Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "AMAL.S",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Administrator",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/dummy profile photo.jpg"),
                  ),
                ],
              ),
            ),
          ),
          w15,
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  sidebarBackground.withOpacity(0.95),
                  sidebarBackground
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 0),
                  blurRadius: 6,
                )
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                ...List.generate(labels.length, (index) {
                  final bool isSelected = _selectedindex == index;

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () => _selectpage(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 12),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? selectedColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.25),
                                    offset: const Offset(0, 2),
                                    blurRadius: 10,
                                  )
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color:
                                    isSelected ? selectedIconColor : iconColor,
                                size: 26,
                              ),
                              child: icons[index],
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: Text(
                                labels[index],
                                style: isSelected
                                    ? selectedLabelStyle
                                    : labelStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                const Spacer(),
                // Optional: Add a logout or footer section here if you want
              ],
            ),
          ),
          Expanded(
            child: _overrideWidget ?? _adminpage[_selectedindex],
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade50,
    );
  }
}
