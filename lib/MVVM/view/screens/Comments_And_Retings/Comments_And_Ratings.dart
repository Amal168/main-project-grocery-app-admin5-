import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';
import 'package:intl/intl.dart';

class CommentsAndRatings extends StatefulWidget {
  const CommentsAndRatings({super.key});

  @override
  State<CommentsAndRatings> createState() => _CommentsAndRatingsState();
}

class _CommentsAndRatingsState extends State<CommentsAndRatings> {
  final CollectionReference commentCollection =
      FirebaseFirestore.instance.collection('CommentReatings');

  // Delete comment from Firestore
  Future<void> _deleteComment(String docId) async {
    await commentCollection.doc(docId).delete();
  }

  String formatTimestamp(Timestamp timestamp) {
    final dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: commentCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data?.docs ?? [];
        if (data.isEmpty) {
          return const Center(child: Text("No Comments found."));
        }

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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("No", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Customer Name & Phone", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Rating", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Comments", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(" ", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      ...List.generate(data.length, (index) {
                        final doc = data[index];
                        final docId = doc.id;
                        final name = doc['name'] ?? 'Unknown';
                        final phone = doc['phonenumber'] ?? '';
                        final rating = doc['rating'].toString();
                        final message = doc['message'] ?? '';
                        final timestamp = doc['timestamp'] is Timestamp
                            ? formatTimestamp(doc['timestamp'])
                            : 'Invalid Date';

                        return TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text("${index + 1}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(name, textAlign: TextAlign.center),
                                  Text(phone, textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(rating),
                                      const Icon(Icons.star, color: Colors.yellow),
                                    ],
                                  ),
                                  Text(timestamp, textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(message, textAlign: TextAlign.center),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => _deleteComment(docId),
                                    icon: const Icon(Icons.delete, size: 30),
                                  ),
                                  w10,
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
      },
    );
  }
}
