import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stepper dummy
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.location_on, size: 18, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                Icon(Icons.circle, size: 8, color: Colors.grey),
                SizedBox(width: 8),
                Icon(Icons.check_circle, size: 18, color: Colors.black),
              ],
            ),
            const SizedBox(height: 40),

            // Icon success
            Icon(Icons.shopping_cart_checkout, size: 100, color: Colors.black),
            const SizedBox(height: 20),

            // Text sukses
            const Text(
              'Pesanan Sukses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              'Terima kasih telah membeli. Pesanan Anda\nakan dikirim dalam 3–5 hari kerja',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 444),

            // Tombol kembali belanja
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
                // Arahkan ke halaman belanja
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                "Kembali Belanja",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
