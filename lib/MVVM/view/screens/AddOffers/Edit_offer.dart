import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';
import 'package:grocery_app_admin5/MVVM/utils/customeSizedbox.dart';



class EditOffer extends StatefulWidget {
  const EditOffer({super.key});

  @override
  State<EditOffer> createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOffer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          elevation: 10,
          child: Container(
            width: 1098,
            height: 396,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 500,
                  height: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    "assets/add3.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  minWidth: 269,
                  height: 54,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.grey)),
                  onPressed: () {},
                  child: const Text(
                    "Add image",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Starting Date",
                  style: TextStyle( fontSize: 36),
                ),
                MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.grey)),
                  minWidth: 539,
                  height: 80,
                  elevation: 10,
                  onPressed: () {
                    // Select the Start date
                  },
                  child: const Text("2025-02-25 "),
                )
              ],
            ),
            const SizedBox(
              width: 22,
            ),
            Column(
              children: [
                const Text("Ending Date",
                    style:
                        TextStyle( fontSize: 36)),
                MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.grey)),
                  minWidth: 539,
                  height: 80,
                  elevation: 10,
                  onPressed: () {
                    // Select the End date
                  },
                  child: const Text("2025-02-27"),
                )
              ],
            ),
          ],
        ),
        h30,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: offerbutton1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.grey)),
              minWidth: 290,
              height: 83,
              elevation: 10,
              onPressed: () {
                // function to reject Adds
              },
              child: const Text("Reject",
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.white)),
            ),
            const SizedBox(
              width: 22,
            ),
            MaterialButton(
              color: toggle2color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.grey)),
              minWidth: 290,
              height: 83,
              elevation: 10,
              onPressed: () {
                // function to Send Adds;
              },
              child: const Text("Resend",
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.white)),
            )
          ],
        )
      ],
    );
  }
}
