import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
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
  final List<String> _adds = [
    "assets/add1.png",
    "assets/add2.png",
    "assets/add3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
          child: ListView.separated(
            itemCount: _adds.length,
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade50,
                      Colors.deepPurple.shade100.withOpacity(0.4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Offer image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        _adds[index],
                        // width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Offer details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Special Offer #${index + 1}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.deepPurple),
                              const SizedBox(width: 8),
                              Text(
                                "Start: 23/5/2023",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepPurple.shade400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Colors.deepPurple),
                              const SizedBox(width: 8),
                              Text(
                                "End: 23/6/2023",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepPurple.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Action buttons on right
                    Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => widget.onNavigate(EditOffer()),
                          icon: const Icon(Icons.edit_outlined),
                          label: const Text("Edit"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Replace with delete logic if needed
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AddOffers()));
                          },
                          icon: const Icon(Icons.delete_outline),
                          label: const Text("Delete"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),

        // Add Offer Floating Button
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton.extended(
            onPressed: () => widget.onNavigate2(AddOffers()),
            backgroundColor: Colors.deepPurpleAccent,
            icon: const Icon(Icons.add),
            label: const Text(
              'Add Offer',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
