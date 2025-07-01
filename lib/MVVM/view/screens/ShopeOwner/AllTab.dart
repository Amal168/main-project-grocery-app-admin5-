import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class CustomerAllTab extends StatefulWidget {
  final String category;
  final String shopid;
  final List<DocumentSnapshot> filteredDocs;

  const CustomerAllTab({
    super.key,
    required this.category,
    required this.shopid,
    required this.filteredDocs,
  });

  @override
  State<CustomerAllTab> createState() => _CustomerAllTabState();
}

class _CustomerAllTabState extends State<CustomerAllTab> {
  int selectedIndex = -1;
  String selectedType = 'All';
  List<String> typeList = ['All'];
  List<DocumentSnapshot> displayedDocs = [];

  @override
  void initState() {
    super.initState();
    _extractTypes();
    _filterDisplayedDocs();
  }

  void _extractTypes() {
    final types = widget.filteredDocs
        .map((doc) => (doc['type'] as String?)?.trim())
        .where((type) => type != null && type.isNotEmpty)
        .toSet()
        .cast<String>()
        .toList();

    setState(() {
      typeList = ['All', ...types];
    });
  }

  void _filterDisplayedDocs() {
    final filtered = widget.filteredDocs.where((doc) {
      final type = doc['type']?.toString().trim().toLowerCase() ?? '';
      return selectedType == 'All' || type == selectedType.toLowerCase();
    }).toList();

    setState(() {
      displayedDocs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (typeList.length > 1)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: typeList.map((type) {
                final isSelected = selectedType == type;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(type),
                    selected: isSelected,
                    onSelected: (_) {
                      selectedType = type;
                      selectedIndex = -1;
                      _filterDisplayedDocs();
                    },
                    selectedColor: toggle2color,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    backgroundColor: Colors.grey[200],
                  ),
                );
              }).toList(),
            ),
          ),
        Expanded(
          child: displayedDocs.isEmpty
              ? const Center(child: Text('No products found.'))
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  itemCount: displayedDocs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 270,
                  ),
                  itemBuilder: (context, index) {
                    final product = displayedDocs[index].data() as Map<String, dynamic>;

                    String product_name = product['product_name'] ?? 'No Name';
                    String image = product['image'] ?? '';
                    int stock = product['stock'] ?? 0;
                    String unit = product['unit'] ?? '';
                    String price = product['product_price']?.toString() ?? '0';
                    bool isLowStock = stock < 4;
                    bool isSelected = selectedIndex == index;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: image.isNotEmpty
                                  ? Image.network(
                                      image,
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/package .jpg',
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              product_name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Only $stock Left",
                              style: TextStyle(
                                color: isLowStock ? redbutton : toglecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "$unit - ₹$price",
                              style: const TextStyle(fontSize: 14),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isSelected ? toggle2color : Colors.white,
                                  foregroundColor: isSelected ? Colors.white : Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: toggle2color),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Text(isSelected ? "Selected" : "Select"),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
