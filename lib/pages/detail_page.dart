import 'package:flutter/material.dart';
import 'alamat_tagihan.dart'; // Ganti dengan path sesuai struktur proyek kamu

class DetailPage extends StatefulWidget {
  final String productName;
  final String imagePath;
  final String price;
  final String rating;

  const DetailPage({
    super.key,
    required this.productName,
    required this.imagePath,
    required this.price,
    required this.rating,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? selectedGrip;
  int quantity = 1;

  void _showBottomSheet(bool isBuyNow) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 60,
          ),
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(widget.imagePath, height: 100)),
                  const SizedBox(height: 8),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          widget.productName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.price),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Pilih Ukuran",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: ["4U", "3U"].map((grip) {
                      final isSelected = selectedGrip == grip;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ChoiceChip(
                          label: Text(grip),
                          selected: isSelected,
                          onSelected: (_) {
                            setModalState(() {
                              selectedGrip = isSelected ? null : grip;
                            });
                            setState(() {
                              selectedGrip = isSelected ? null : grip;
                            });
                          },
                          selectedColor: Colors.black,
                          backgroundColor: Colors.grey.shade200,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Kuantitas",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setModalState(() => quantity--);
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setModalState(() => quantity++);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Tutup bottom sheet

                        if (isBuyNow) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AlamatTagihanPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Produk ditambahkan ke keranjang!"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        isBuyNow ? "Beli Sekarang" : "Tambahkan Keranjang",
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: () => _showBottomSheet(false),
                icon: const Icon(Icons.shopping_cart_outlined),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _showBottomSheet(true),
                  child: const Text("Beli sekarang"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.pop(context),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Berhasil ditambahkan ke wishlist!"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Center(
              child: Transform.rotate(
                angle: 1.5708,
                child: Image.asset(widget.imagePath, height: 280),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.productName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Varian Berat / Grip",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: ["4U", "3U"].map((variant) {
                final isSelected = selectedGrip == variant;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(variant),
                    selected: isSelected,
                    onSelected: (_) => setState(() {
                      selectedGrip = isSelected ? null : variant;
                    }),
                    selectedColor: Colors.black,
                    backgroundColor: Colors.grey.shade200,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Deskripsi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('''
Flex: Medium
Frame: HM Graphite, Flex Fuse, Tungsten
Shaft: HM Graphite, Namd™, Ultra PE Fiber
Joint: NEW Built-in T-Joint
Length: 10 mm longer
Weight / Grip: 4U (Avg. 83g) G5,6
            3U (Avg. 88g) G4,5,6
Stringing Advice: 4U: 20 – 27 lbs, 3U: 20 – 28 lbs
              ''', style: TextStyle(height: 1.5)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
