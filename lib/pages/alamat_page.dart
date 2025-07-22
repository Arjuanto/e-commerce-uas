import 'package:flutter/material.dart';

class AlamatPage extends StatelessWidget {
  const AlamatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alamat Pengiriman")),
      body: const Center(child: Text("Belum ada alamat pengiriman.")),
    );
  }
}
