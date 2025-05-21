
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:grocery_app_admin5/MVVM/utils/sliderpage.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/AllTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/RiceTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/VegitableTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/milkTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/pastTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/snacksTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/soapTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/product/spiceTab.dart';
class ShopownerProducts extends StatefulWidget {
  const ShopownerProducts({super.key});

  @override
  State<ShopownerProducts> createState() => _ShopownerProductsState();
}

class _ShopownerProductsState extends State<ShopownerProducts> {
  List productpages = [
    Alltab(),
    RiceTab(),
    Soaptab(),
    Snackstab(),
    Pasttab(),
    Milktab(),
    Spicetab(),
    Vegitabletab()
  ];
  int _selectedindex = 0;

  void _ontapMethod(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List productlist = [
    "All",
    "Rice",
    "Soap",
    "Snacks",
    "Paste",
    "Milk",
    "Spices",
    "Vegitables"
  ];

  int _productIndex = 0;

  void _ontapProduct(int index) {
    setState(() {
      _productIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: Sliderpage()),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(onPressed: () =>_ontapMethod(0), child: const Text("All")),
            ElevatedButton(onPressed: () =>_ontapMethod(1), child: const Text("Rice")),
            ElevatedButton(onPressed: () =>_ontapMethod(2), child: const Text("Soap")),
            ElevatedButton(onPressed: () =>_ontapMethod(3), child: const Text("Snacks")),
            ElevatedButton(onPressed: () =>_ontapMethod(4), child: const Text("Paste")),
            ElevatedButton(onPressed: () =>_ontapMethod(5), child: const Text("Milk")),
            ElevatedButton(onPressed: () =>_ontapMethod(6), child: const Text("Spices")),
            ElevatedButton(onPressed: () =>_ontapMethod(7), child: const Text("Vegitables")),
          ],
        ),
        // ListView.builder(
        //   itemBuilder: (context, index) {
        //     return ElevatedButton(
        //         onPressed: () {},
        //         child: const Text(productlist[i]));
        //   },
        // ),
        h15,
        Expanded(child: productpages[_selectedindex])
      ],
    );
  }
}
