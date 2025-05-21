
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
  final List<Widget> _adminpage = [
    const Center(
      child: Text("Catalog"),
    ),
    // Center(
    //   child: Text("Customer"),
    // ),
    const CustomerList(),
    
    // Center(
    //   child: Text("Shop"),
    // ),
    const ShopownerList(),
    // Center(
    //   child: Text("Feedback"),
    // ),
    const CommentsAndRatings(),
    // Center(
    //   child: Text("Offers"),
    // ),
    ViewOffers()
    // const EditOffer()
  ];
  int _selectedindex = 2;
  void _selectpage(int index) {
    setState(() {
      _selectedindex = index;
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
              child: Image(image: AssetImage("assets/Screenshot 2025-03-26 131955.png")),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Admin Name"),
                    Text(
                      "Administrator",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                w10,
                const CircleAvatar(
              radius: 18,
              child: Image(image: AssetImage("assets/dummy profile photo.jpg"),fit: BoxFit.cover,),
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
                GestureDetector(
                  onTap: () =>_selectpage(0),
                  child: Card(
                    color: Colors.white,
                    elevation: _selectedindex==0?10:0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/catologicon.png"),width: 30),
                          SizedBox(width: 10),
                          Text("CATALOG",textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()=>_selectpage(1),
                  child: Card(
                    color: Colors.white,

                    elevation: _selectedindex==1?10:0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/cuotomericpn.png"),width: 30),
                          SizedBox(width: 10),
                          Text("CUSTOMER",textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () =>_selectpage(2),
                  child: Card(
                    color: Colors.white,

                    elevation: _selectedindex==2?10:0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/shopicon.png"),width: 30),
                          SizedBox(width: 10),
                          Text("SHOPS",textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: ()=>_selectpage(3),
                  child: Card(
                    color: Colors.white,

                    elevation: _selectedindex==3?10:0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/commentratingicon.png"),width: 30,),
                          SizedBox(width: 10),
                          Text("COMMENTS\nRATINGS",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () =>_selectpage(4),
                  child: Card(
                    color: Colors.white,

                    elevation: _selectedindex==4?10:0,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image(image: AssetImage("assets/offericon.png"),width: 30,),
                          SizedBox(width: 10),
                          Text("ADD \n OFFERS",textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           Expanded(
            child: _adminpage[_selectedindex],
          ),
        ],
      ),
    );
  }
}