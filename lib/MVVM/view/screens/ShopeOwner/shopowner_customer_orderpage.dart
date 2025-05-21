
import 'package:flutter/material.dart';
import 'package:grocery_app_admin5/MVVM/utils/colors.dart';

class ShopownerCustomerOrderpage extends StatefulWidget {
  const ShopownerCustomerOrderpage({super.key});

  @override
  State<ShopownerCustomerOrderpage> createState() =>
      _ShopownerCustomerOrderpageState();
}

class _ShopownerCustomerOrderpageState
    extends State<ShopownerCustomerOrderpage> {
  List<String> selectedRadioValues = List.generate(3, (index) => '');
  String radiobutton = '';
  final TextEditingController _subtotal = TextEditingController();
  final TextEditingController _deliveryFee = TextEditingController();
  final TextEditingController _discount = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subtotal.addListener(_updateTotal);
    _deliveryFee.addListener(_updateTotal);
    _discount.addListener(_updateTotal);
  }

  @override
  void dispose() {
    _subtotal.removeListener(_updateTotal);
    _deliveryFee.removeListener(_updateTotal);
    _discount.removeListener(_updateTotal);

    _subtotal.dispose();
    _deliveryFee.dispose();
    _discount.dispose();
    super.dispose();
  }

  void _updateTotal() {
    setState(() {});
  }

  double fintotal() {
    double subtotal = double.tryParse(_subtotal.text) ?? 0.0;
    double deliveryFee = double.tryParse(_deliveryFee.text) ?? 0.0;
    double discount = double.tryParse(_discount.text) ?? 0.0;

    return subtotal + deliveryFee - discount;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 80,left: 80,top: 20,bottom: 20),
      child: Card(
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/images.jpg",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product Name",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("1 Piece",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 20,),
                            Text("20Rs",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: "1",
                                  groupValue: selectedRadioValues[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadioValues[index] = value!;
                                    });
                                  },
                                ),
                                const Text("Check"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: "2",
                                  groupValue: selectedRadioValues[index],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadioValues[index] = value!;
                                    });
                                  },
                                ),
                                const Text("Uncheck"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: selectedRadioValues.length,
              ),
            ),
      
            // Bottom Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(),bottom: BorderSide(),left: BorderSide(),right: BorderSide()),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30),bottom: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInputRow("Subtotal", _subtotal, "40.00Rs"),
                    const SizedBox(height: 10),
                    _buildInputRow("Delivery Fee", _deliveryFee,
                        radiobutton == "1" ? "2.00Rs" : "0.00Rs"),
                    const SizedBox(height: 10),
                    _buildInputRow("Discount", _discount, "0.00Rs"),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Radio<String>(
                          value: '1',
                          groupValue: radiobutton,
                          onChanged: (value) {
                            setState(() {
                              radiobutton = value!;
                              _deliveryFee.text = "2.00";
                            });
                          },
                        ),
                        const Text("Check"),
                        Radio<String>(
                          value: '2',
                          groupValue: radiobutton,
                          onChanged: (value) {
                            setState(() {
                              radiobutton = value!;
                              _deliveryFee.text = "0.00";
                            });
                          },
                        ),
                        const Text("Uncheck"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      elevation: 5,
                      minWidth: double.infinity,
                      height: 40,
                      color: toggle2color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "A message will be sent to the customer\nAbout the order being completed",
                            textAlign: TextAlign.center,
                          ),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Row(
                            children: [
                              const Text("Total:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Inknut_Antiqua",
                                      fontWeight: FontWeight.bold)),
                                       Text("₹${fintotal().toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Inria_Sans",
                                  fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 100,),
                            ],
                          ),
                          const Row(
                            children: [
                              Text("Send",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Inknut_Antiqua",
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 5),
                              Icon(Icons.send),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRow(
      String label, TextEditingController controller, String hintText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Inknut_Antiqua",
                fontWeight: FontWeight.bold)),
        SizedBox(
          width: 100,
          height: 32,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }
}
