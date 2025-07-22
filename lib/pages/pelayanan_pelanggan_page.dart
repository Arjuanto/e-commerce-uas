import 'package:flutter/material.dart';

class PelayananPelangganPage extends StatelessWidget {
  const PelayananPelangganPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pelayanan Pelanggan")),
      body: const Center(child: Text("Hubungi layanan pelanggan.")),
    );
  }
}
