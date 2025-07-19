import 'package:flutter/material.dart';
import 'order_succes_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int _selectedOption = 0;

  final List<Map<String, dynamic>> paymentOptions = [
    {'label': 'Online Banking', 'icon': 'fpx'},
    {'label': 'Credit / Debit Card', 'icon': 'visa'},
    {'label': 'Paypal', 'icon': 'paypal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stepper Dummy
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.location_on, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Icon(Icons.circle, size: 8, color: Colors.grey),
                  Icon(Icons.circle, size: 8, color: Colors.grey),
                  Icon(Icons.circle, size: 8, color: Colors.black),
                  Icon(Icons.circle, size: 8, color: Colors.grey),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle, size: 18, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment Option",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Payment Options
            Column(
              children: List.generate(paymentOptions.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedOption == index
                            ? Colors.black
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _selectedOption == index
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: _selectedOption == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            paymentOptions[index]['label'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Image.asset(
                          'images/${paymentOptions[index]['icon'].toLowerCase()}.png',
                          width: 50,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 290),

            // Ringkasan Harga
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  _PriceRow(label: "Sub-total", value: "Rp. 2.500.000"),
                  _PriceRow(label: "Biaya Pengiriman", value: "Rp. 12.000"),
                  Divider(),
                  _PriceRow(
                    label: "Total Pembayaran",
                    value: "Rp. 2.488.000",
                    isBold: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tombol Pesan
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccessPage(),
                  ),
                );
              },

              child: const Text(
                "Pesan",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
