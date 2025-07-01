import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/shopowner_customer_list.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/shopowner_products.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/ShopownerViewProfile.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/Shopowneradd.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/shopownerblock.dart';

class ShopownerList extends StatefulWidget {
  final Function(Widget widget) onNavigate;
  final Function(Widget widget) onNavigate2;

  const ShopownerList({
    super.key,
    required this.onNavigate,
    required this.onNavigate2,
  });

  @override
  State<ShopownerList> createState() => _ShopownerListState();
}

class _ShopownerListState extends State<ShopownerList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget? drawerContent;

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void _openProfileDrawer(Map<String, dynamic> data) {
    setState(() {
      drawerContent = ShopownerviewprofileDrawer(
        name: data['name'],
        shopname: data['shopname'],
        shoptime: data['shoptime'],
        email: data['email'],
        phone: data['phone'],
        location: data['location'],
        address: data['place'],
        // shopPhotoUrl: data['shopPhotoUrl'],
      );
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: drawerContent != null
          ? Drawer(
              width: MediaQuery.of(context).size.width * 0.20,
              child: drawerContent!,
            )
          : null,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('role', isEqualTo: 'ShopOwner')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.docs ?? [];
          if (data.isEmpty) {
            return const Center(child: Text("No shop owners found."));
          }

   
          final filteredData = data.where((doc) {
            final shopData = doc.data() as Map<String, dynamic>;
            final name = shopData['name'].toString().toLowerCase();
            final email = shopData['email'].toString().toLowerCase();
            final phone = shopData['phone'].toString().toLowerCase();
            return name.contains(searchQuery.toLowerCase()) ||
                email.contains(searchQuery.toLowerCase()) ||
                phone.contains(searchQuery.toLowerCase());
          }).toList();

          return Column(
            children: [
              Card(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 327,
                        height: 43,
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(() {
                              searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Search by name, email or phone",
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(iconicGreen),
                          foregroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Shopowneradd(),
                          );
                        },
                        child: const Text("Add Customer"),
                      ),
                    ],
                  ),
                ),
              ),

             
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FixedColumnWidth(60),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                      4: FlexColumnWidth(3),
                    },
                    children: [
                      const TableRow(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(),
                            left: BorderSide(),
                            right: BorderSide(),
                          ),
                        ),
                        children: [
                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("No", style: TextStyle(fontWeight: FontWeight.bold)))),
                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Customer Name", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)))),
                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Phone Number", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)))),
                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Email", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)))),
                          TableCell(child: Padding(padding: EdgeInsets.all(8), child: Text("Options", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)))),
                        ],
                      ),
                      ...List.generate(filteredData.length, (index) {
                        final shopData = filteredData[index].data() as Map<String, dynamic>;
                        final docId = filteredData[index].id;

                        return TableRow(
                          decoration: const BoxDecoration(
                              border: Border.symmetric(), color: Colors.white),
                          children: [
                            TableCell(child: Padding(padding: EdgeInsets.all(20.0), child: Text('${index + 1}'))),
                            TableCell(child: Padding(padding: EdgeInsets.all(20.0), child: Text(shopData['name'], textAlign: TextAlign.center))),
                            TableCell(child: Padding(padding: EdgeInsets.all(20.0), child: Text(shopData['phone'], textAlign: TextAlign.center))),
                            TableCell(child: Padding(padding: EdgeInsets.all(20.0), child: Text(shopData['email'], textAlign: TextAlign.center))),
                            TableCell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    onPressed: () => widget.onNavigate(ShopownerProducts(shopid: shopData['uid'],)),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/Shopadminitem.png", height: 20),
                                        const Text("Shop Items"),
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () => widget.onNavigate2(ShopownerCustomerList()),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/chatsAndOrder.png", height: 20),
                                        const Text("Chats&Order"),
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () => _openProfileDrawer(shopData),
                                    child: const Column(
                                      children: [
                                        Icon(Icons.person, size: 20),
                                        Text("Profile"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => shopownerblock(
                                          name: shopData['name'],
                                          id: docId,
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: Colors.white),
                                    child: const Text("Block"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
