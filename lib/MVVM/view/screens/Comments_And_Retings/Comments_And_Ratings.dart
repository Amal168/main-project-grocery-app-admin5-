import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';

class Comment {
  final String customerName;
  final String phoneNumber;
  final int rating;
  final String dateTime;
  final String comment;

  Comment({
    required this.customerName,
    required this.phoneNumber,
    required this.rating,
    required this.dateTime,
    required this.comment,
  });
}

class CommentsAndRatings extends StatefulWidget {
  const CommentsAndRatings({super.key});

  @override
  State<CommentsAndRatings> createState() => _CommentsAndRatingsState();
}

class _CommentsAndRatingsState extends State<CommentsAndRatings> {
  // List of comments
  List<Comment> comments = List.generate(
    15,
    (index) => Comment(
      customerName: 'Customer ${index + 1}',
      phoneNumber: '1234567890',
      rating: index + 1,
      dateTime: 'dd/mm/yyyy hh:mm:ss',
      comment: 'Example comment ${index + 1}',
    ),
  );

  // Delete function
  void _deleteComment(int index) {
    setState(() {
      comments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('CommentReatings').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
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
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Customer Name & Phone Number",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Rating",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Comments",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  " ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...List.generate(
                          comments.length,
                          (index) {
                            final comment = comments[index];
                            return TableRow(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text("${index + 1}"),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(comment.customerName,
                                            textAlign: TextAlign.center),
                                        Text(comment.phoneNumber,
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("${comment.rating}",
                                                textAlign: TextAlign.center),
                                            const Icon(Icons.star,
                                                color: Colors.yellow),
                                          ],
                                        ),
                                        Text(comment.dateTime),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      comment.comment,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () => _deleteComment(index),
                                        icon:
                                            const Icon(Icons.delete, size: 40),
                                      ),
                                      w10,
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
        });
  }
}
