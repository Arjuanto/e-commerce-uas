import 'package:flutter/material.dart';
import 'detail_page.dart'; // Import halaman detail

class WishlistPage extends StatelessWidget {
  final List<Map<String, String>> wishlistItems = [
    {
      "name": "Astrox 77 Pro",
      "type": "Racket",
      "price": "Rp 2.500.000",
      "image": "images/astrox77proP.png",
    },
    {
      "name": "Nanoflare 700 pro",
      "type": "Racket",
      "price": "Rp 2.500.000",
      "image": "images/astrox77proP.png",
    },
    {
      "name": "Astrox 88 S Pro",
      "type": "Racket",
      "price": "Rp 2.500.000",
      "image": "images/astrox77proP.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(color: Colors.black),
        title: Text('Wishlist', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  item["image"]!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["name"]!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        item["type"]!,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      Text(
                        item["price"]!,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          productName: item["name"]!,
                          imagePath: item["image"]!,
                          price: item["price"]!,
                          rating:
                              "4.8", // sementara default atau bisa ambil dari item["rating"]
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Beli Sekarang"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
