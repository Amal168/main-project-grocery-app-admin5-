import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class Alltab extends StatefulWidget {
  const Alltab({super.key});

  @override
  State<Alltab> createState() => _AlltabState();
}

class _AlltabState extends State<Alltab> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        final data = snapshot.data?.docs ?? [];
        if (data.isEmpty) {
          return const Center(child: Text("No products found."));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              final doc = data[index];
              final String name = doc['product_name'] ?? 'Unnamed';
              final String unit = doc['unit'] ?? 'unit';
              final String price = doc['product_price'].toString() ?? "0";
              final int stock = int.parse(doc['stock']) ?? 0;

              final bool isLowStock = stock < 4;
              final Color stockColor = isLowStock ? redbutton : toglecolor;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                shadowColor: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/images.jpg",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
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
                            stock.toString(),
                            style: TextStyle(
                              color: stockColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            " left",
                            style: TextStyle(
                              color: stockColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "$unit - ₹$price",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
