import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ChatPage.dart';
import 'package:grocery_app_admin5/MVVM/view/screens/ShopeOwner/shopowner_customer_orderpage.dart';

class ShopownerCustomerList extends StatefulWidget {

  const ShopownerCustomerList({super.key,});

  @override
  State<ShopownerCustomerList> createState() => _ShopownerCustomerListState();
}

class _ShopownerCustomerListState extends State<ShopownerCustomerList> {
  int count = 1;
  
  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 327,
                  height: 43,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
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
                // border: TableBorder.all(),
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        border: Border(
                            top: BorderSide(),
                            left: BorderSide(),
                            right: BorderSide())),
                    children: [
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("No",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      )),
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Shopowner Name",
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
                        child: Text(
                          "Options",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      )),
                    ],
                  ),
                  ...List.generate(
                    15,
                    (index) {
                      return TableRow(
                        decoration: BoxDecoration(
                            border: Border.all(), color: Colors.white),
                        children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("${index + 1}"),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Customer ${index + 1}",
                                textAlign: TextAlign.center),
                          )),
                          const TableCell(
                              child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child:
                                Text("1234567890", textAlign: TextAlign.center),
                          )),
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "customer${index + 1}@gmail.com",
                              textAlign: TextAlign.center,
                            ),
                          )),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    // code for customer chat  page
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const Chatpage()));
                                    
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Image.asset(
                                          "assets/Group.png",
                                          height: 20,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text("Chats"),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    // code for Order page
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ShopownerCustomerOrderpage()));
                                  },
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Image.asset(
                                          "assets/Order2.png",
                                          height: 20,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const Text("Order"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
