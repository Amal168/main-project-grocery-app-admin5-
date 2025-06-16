import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/AddOffers/Add_offers.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/AddOffers/Edit_offer.dart';

class ViewOffers extends StatefulWidget {
  final Function(Widget widget) onNavigate;
  final Function(Widget widget) onNavigate2;

  const ViewOffers({super.key, required this.onNavigate, required this.onNavigate2});

  @override
  State<ViewOffers> createState() => _ViewOffersState();
}

class _ViewOffersState extends State<ViewOffers> {
  void _confirmDelete(String docId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this offer?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection('offers').doc(docId).delete();
              Navigator.pop(ctx);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('offers').orderBy('timestamp', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No offers available"));
        }

        final offers = snapshot.data!.docs;

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: ListView.separated(
                itemCount: offers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final offer = offers[index];
                  final data = offer.data() as Map<String, dynamic>;
                  final docId = offer.id;

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.withOpacity(0.1),
                          Colors.deepPurpleAccent.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: data['imagePath'] != null && data['imagePath']!.isNotEmpty
                              ? Image.network(data['imagePath'], width: 100, height: 100, fit: BoxFit.cover)
                              : Image.asset('assets/add3.jpg', width: 100, height: 100, fit: BoxFit.fitWidth),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data["title"] ?? "Special Offer",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple.shade700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month_outlined, size: 16, color: Colors.deepPurple),
                                  const SizedBox(width: 6),
                                  Text(
                                    "Start: ${data["startingDate"] ?? ''}",
                                    style: TextStyle(fontSize: 14, color: Colors.deepPurple.shade400),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.deepPurple),
                                  const SizedBox(width: 6),
                                  Text(
                                    "End: ${data["endingDate"] ?? ''}",
                                    style: TextStyle(fontSize: 14, color: Colors.deepPurple.shade400),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      widget.onNavigate(EditOffer(
                                        offerId: docId,
                                        initialData: data,
                                      ));
                                    },
                                    icon: const Icon(Icons.edit_outlined),
                                    label: const Text("Edit"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  ElevatedButton.icon(
                                    onPressed: () => _confirmDelete(docId),
                                    icon: const Icon(Icons.delete_outline),
                                    label: const Text("Delete"),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.redAccent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton.extended(
                onPressed: () => widget.onNavigate2(AddOffers()),
                backgroundColor: Colors.deepPurpleAccent,
                icon: const Icon(Icons.add),
                label: const Text('Add Offer', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        );
      },
    );
  }
}
