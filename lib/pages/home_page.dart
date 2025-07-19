import 'package:aplikasi_uas/pages/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Hi, Arjuanto !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Text("Welcome back"),
            const SizedBox(height: 12),

            // PROMO HORIZONTAL
            SizedBox(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(4, (index) {
                  final names = [
                    'Astrox 99 Pro',
                    'Nanoflare 1000Z',
                    'Duora Z-Strike',
                    'Arcsaber 11 Pro',
                  ];
                  final prices = [
                    'Rp 2.000.000',
                    'Rp 1.750.000',
                    'Rp 1.800.000',
                    'Rp 1.950.000',
                  ];
                  final boxColors = [
                    const Color.fromARGB(255, 93, 255, 220),
                    const Color.fromARGB(255, 255, 216, 107),
                    const Color.fromARGB(255, 255, 110, 163),
                    const Color.fromARGB(255, 105, 208, 255),
                  ];
                  return Container(
                    width: 290,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: boxColors[index],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${names[index]}\nDiskon 15%"),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailPage(
                                        productName: names[index],
                                        imagePath: 'images/astrox77proP.png',
                                        price: prices[index],
                                        rating: '⭐ 4.${9 - index}',
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  backgroundColor:
                                      Colors.white, // Warna latar tombol
                                  foregroundColor:
                                      Colors.black, // Warna teks tombol
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text("Beli Sekarang"),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'images/astrox77proP.png',
                          // height: 80,
                          // width: 80,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),
            const Text("Brands"),
            const SizedBox(height: 8),
            Row(
              children: [
                FilterChip(
                  label: const Text("🏸"),
                  selected: true,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text("🛡️"),
                  selected: false,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text("👜"),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),

            const SizedBox(height: 16),

            // PRODUK LIST
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(6, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          productName: 'Astrox 88 D Pro',
                          imagePath: 'images/astrox77proP.png',
                          price: 'Rp 2.500.000',
                          rating: '⭐ 5.0',
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          // Gambar di tengah
                          child: Image.asset(
                            'images/astrox77proP.png',
                            height: 120,
                          ),
                        ),
                        const SizedBox(height: 6),

                        // Nama dan Harga dalam 1 baris
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Astrox 77 Pro",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Rp 2.500.000",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Rating
                        const Row(
                          children: [
                            Icon(Icons.star, size: 14, color: Colors.amber),
                            SizedBox(width: 4),
                            Text("5.0", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
