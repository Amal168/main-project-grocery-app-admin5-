import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/Customer/Customer_shopowner_list.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/customerBlock.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/customerViewProfile.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/popupScreens/customeradd.dart';

class CustomerList extends StatefulWidget {
  final Function(Widget widget) onNavigate;

  const CustomerList({super.key, required this.onNavigate});

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where('role', isEqualTo: 'Customer')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.docs;
          if (data == null || data.isEmpty) {
            return const Center(child: Text("No data"));
          }

          final filteredData = data.where((doc) {
            final name = (doc['name'] ?? '').toString().toLowerCase();
            final email = (doc['email'] ?? '').toString().toLowerCase();
            final phone = (doc['phone'] ?? '').toString().toLowerCase();
            return name.contains(searchQuery.toLowerCase()) ||
                email.contains(searchQuery.toLowerCase()) ||
                phone.contains(searchQuery.toLowerCase());
          }).toList();

          return Column(
            children: [
              Card(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 161,
                  alignment: Alignment.centerLeft,
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
                            hintText: "Search by name, phone or email",
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: const Icon(Icons.search),
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
                            builder: (context) => Customeradd(),
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
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
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
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("No",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Phone Number",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Email",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            )),
                            TableCell(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Options",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center),
                            )),
                          ],
                        ),
                        ...List.generate(filteredData.length, (index) {
                          final customer = filteredData[index];
                          final name = customer['name'] ?? 'No Name';
                          final phone = customer['phone'] ?? 'N/A';
                          final email = customer['email'] ?? 'N/A';
                          final location = customer['location'] ?? '';
                          final address = customer['Address'] ?? '';
                          final id = customer.id;

                          return TableRow(
                            decoration: const BoxDecoration(
                              border: Border.fromBorderSide(
                                  BorderSide(color: Colors.black12)),
                              color: Colors.white,
                            ),
                            children: [
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text("${index + 1}"),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(data[index]['name'], textAlign: TextAlign.center),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(data[index]['phone'], textAlign: TextAlign.center),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(data[index]['email'], textAlign: TextAlign.center),
                              )),
                              TableCell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        widget
                                            .onNavigate(const CustomerShopList());
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            child: Image.asset(
                                              "assets/chatsAndOrder.png",
                                              height: 20,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Text("Chats&Order"),
                                        ],
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Customerviewprofile(
                                              name: name,
                                              email: email,
                                              phone: phone,
                                              location: location,
                                              address: address,
                                            );
                                          },
                                        );
                                      },
                                      child: const Column(
                                        children: [
                                          Icon(Icons.person, size: 20),
                                          SizedBox(width: 4),
                                          Text("Profile"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 76),
                                    ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Customerblock(
                                              name: email,
                                              id: id,
                                            );
                                          },
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
              ),
            ],
          );
        });
  }
}
