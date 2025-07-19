import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  List<Map<String, String>> promoItems = [
    {
      "title": "Sport Collection",
      "discount": "30% OFF",
      "image": "images/astrox77pro.png",
    },
    {
      "title": "Nanoflare 700",
      "discount": "15% OFF",
      "image": "images/nanoflare700.png",
    },
  ];

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pencarian',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Promo Items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: promoItems.length,
                itemBuilder: (context, index) {
                  final item = promoItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 300, // << Sesuai dengan tampilan gambar kamu
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 5),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item['discount']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
