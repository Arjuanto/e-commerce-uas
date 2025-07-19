import 'package:flutter/material.dart';

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
                    // child: Icon(Icons.arrow_back),
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

            // Status Pesanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatusItem(count: 0, label: "Pengolahan"),
                  _StatusItem(count: 0, label: "Dikirim"),
                  _StatusItem(count: 0, label: "Siap untuk Pickup"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const Divider(),

            // Menu
            Expanded(
              child: ListView(
                children: const [
                  _ProfileMenuItem(title: "Order Saya"),
                  _ProfileMenuItem(title: "Voucher"),
                  _ProfileMenuItem(title: "Alamat Pengiriman"),
                  _ProfileMenuItem(title: "FAQ"),
                  _ProfileMenuItem(title: "Pelayanan Pelanggan"),
                  _ProfileMenuItem(title: "Pengaturan"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final int count;
  final String label;

  const _StatusItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final String title;

  const _ProfileMenuItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigasi bisa ditambahkan di sini
      },
    );
  }
}
