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
  final List<Widget> productPages = [
    Alltab(),
    RiceTab(),
    Soaptab(),
    Snackstab(),
    Pasttab(),
    Milktab(),
    Spicetab(),
    Vegitabletab(),
  ];

  final List<String> productList = [
    "All",
    "Rice",
    "Soap",
    "Snacks",
    "Paste",
    "Milk",
    "Spices",
    "Vegetables"
  ];

  int selectedIndex = 0;

  void onCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: Sliderpage()),

        h15,

        // Stylish Category Selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ChoiceChip(
                    label: Text(
                      productList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) => onCategoryTap(index),
                    selectedColor: Colors.deepPurpleAccent,
                    backgroundColor: Colors.grey.shade200,
                    elevation: 3,
                    pressElevation: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        h15,

        // Product Tab View
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: productPages[selectedIndex],
          ),
        ),
      ],
    );
  }
}
