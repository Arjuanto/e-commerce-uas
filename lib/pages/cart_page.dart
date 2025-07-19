import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Astrox 77 Pro",
      "price": "2.500.000",
      "image": "images/astrox77proP.png",
    },
    {
      "name": "Nanoflare 700 Pro",
      "price": "2.500.000",
      "image": "images/astrox77proP.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
        centerTitle: true,
        // leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  leading: Image.asset(item['image'], width: 40),
                  title: Text(item['name']),
                  subtitle: Text("Rp ${item['price']}"),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Kode Promo"),
                    Spacer(),
                    Text(
                      "NV24Q2U",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("${cartItems.length} barang"),
                    Spacer(),
                    Text(
                      "Rp 5.000.000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
