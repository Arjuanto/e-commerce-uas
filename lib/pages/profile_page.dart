import 'package:flutter/material.dart';
import 'alamat_page.dart';
import 'order_page.dart';
import 'voucher_page.dart';
import 'pengaturan_page.dart';
import 'pelayanan_pelanggan_page.dart';
import 'faq_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    // child: IconButton(
                    //   icon: const Icon(Icons.arrow_back),
                    //   onPressed: () {
                    //     Navigator.pop(context); // Navigasi kembali
                    //   },
                    // ),
                  ),
                  const Center(
                    child: Text(
                      'Akun Saya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Foto Profil & Nama
            Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Arjuanto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Status Pesanan (Tengah)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _StatusItem(count: 0, label: "Pengolahan", icon: Icons.sync),
                  SizedBox(width: 24),
                  _StatusItem(
                    count: 0,
                    label: "Dikirim",
                    icon: Icons.local_shipping,
                  ),
                  SizedBox(width: 24),
                  _StatusItem(
                    count: 0,
                    label: "Siap Pickup",
                    icon: Icons.store,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),

            // Menu Profil
            Expanded(
              child: ListView(
                children: [
                  _ProfileMenuItem(
                    title: "Order Saya",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OrderPage()),
                      );
                    },
                  ),

                  _ProfileMenuItem(
                    title: "Voucher",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const VoucherPage()),
                      );
                    },
                  ),

                  _ProfileMenuItem(
                    title: "Alamat Pengiriman",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AlamatPage()),
                      );
                    },
                  ),

                  _ProfileMenuItem(
                    title: "FAQ",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FAQPage()),
                      );
                    },
                  ),
                  _ProfileMenuItem(
                    title: "Pelayanan Pelanggan",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PelayananPelangganPage(),
                        ),
                      );
                    },
                  ),
                  _ProfileMenuItem(
                    title: "Pengaturan",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PengaturanPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Status
class _StatusItem extends StatelessWidget {
  final int count;
  final String label;
  final IconData icon;

  const _StatusItem({
    required this.count,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 6),
        Text(
          '$count',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// Widget Menu Profil
class _ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap; // Tambahkan ini

  const _ProfileMenuItem({
    required this.title,
    this.onTap, // Tambahkan ini
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap, // Gunakan parameter ini
    );
  }
}
