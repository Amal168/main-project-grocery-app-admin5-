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
    return Column(
      children: [
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: Soap.length,
            itemBuilder: (context, index) {
              final bool isSelected = selectIndex == index;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(
                    Soap[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: toglecolor,
                  backgroundColor: Colors.grey[200],
                  onSelected: (_) {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 320,
              ),
              itemBuilder: (context, index) {
                final bool isLowStock = count < 4;
                final Color stockColor = isLowStock ? redbutton : toglecolor;

                if (selectIndex == 1 && index > 3) {
                  // Example condition: show less items for non-All categories
                  return const SizedBox.shrink();
                }

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/images.jpg",
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Product Name",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Only ",
                              style: TextStyle(
                                color: stockColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "$count ",
                              style: TextStyle(
                                color: stockColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "left",
                              style: TextStyle(
                                color: stockColor,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "1kg - ₹45",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
