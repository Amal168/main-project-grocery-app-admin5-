import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/sliderpage.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/AllTab.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/admin_slidBar.dart';

class ShopownerProducts extends StatefulWidget {
  final String shopid;
  const ShopownerProducts({super.key, required this.shopid});

  @override
  State<ShopownerProducts> createState() => _ShopownerProductsState();
}

class _ShopownerProductsState extends State<ShopownerProducts>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> _categories = ['All'];
  String _searchQuery = '';
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  void _updateTabController(List<String> categories) {
    _tabController?.dispose();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _tabController?.dispose();
    _searchController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .where('user_id', isEqualTo: widget.shopid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: \${snapshot.error}"));
        }

        final docs = snapshot.data?.docs ?? [];

        final filteredDocs = _searchQuery.isEmpty
            ? docs
            : docs.where((doc) {
                final name =
                    doc['product_name']?.toString().toLowerCase() ?? '';
                return name.contains(_searchQuery.toLowerCase());
              }).toList();

        final allCategories = filteredDocs
            .map((doc) => doc['Category'] as String?)
            .where((cat) => cat != null && cat.trim().isNotEmpty)
            .toSet()
            .cast<String>()
            .toList();

        final newCategories = ['All', ...allCategories];

        if (_tabController == null ||
            _categories.join() != newCategories.join()) {
          _categories = newCategories;
          _updateTabController(_categories);
        }

        return SafeArea(
          child: Column(
            children: [
              Expanded(child: Sliderpage()),
              Container(
                color: toggle2color,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false)
                              _debounce!.cancel();
                            _debounce =
                                Timer(const Duration(milliseconds: 600), () {
                              setState(() {
                                _searchQuery = value;
                              });
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search product by name',
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: toggle2color,
                child: _tabController == null
                    ? const SizedBox()
                    : TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white70,
                        indicatorColor: Colors.white,
                        tabs: _categories.map((cat) => Tab(text: cat)).toList(),
                      ),
              ),
              Expanded(
                child: _tabController == null
                    ? const SizedBox()
                    : TabBarView(
                        controller: _tabController,
                        children: _categories.map((cat) {
                          final productsInTab = cat == 'All'
                              ? filteredDocs
                              : filteredDocs
                                  .where((doc) =>
                                      doc['Category']
                                          ?.toString()
                                          .toLowerCase() ==
                                      cat.toLowerCase())
                                  .toList();

                          return CustomerAllTab(
                            category: cat,
                            shopid: widget.shopid,
                            filteredDocs: productsInTab,
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
