import 'package:flutter/material.dart';

class AlamatTagihanPage extends StatefulWidget {
  const AlamatTagihanPage({super.key});

  @override
  State<AlamatTagihanPage> createState() => _AlamatTagihanPageState();
}

class _AlamatTagihanPageState extends State<AlamatTagihanPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  String? provinsi = 'DKI Jakarta';
  String? negara = 'Indonesia';
  String? opsiPengiriman = 'Pengiriman Standar (+ Rp. 12.000)';
  bool simpanAlamat = false;

  final List<String> provinsiList = ['DKI Jakarta', 'Jawa Barat', 'Banten'];
  final List<String> negaraList = ['Indonesia', 'Malaysia'];
  final List<String> opsiPengirimanList = [
    'Pengiriman Standar (+ Rp. 12.000)',
    'Pengiriman Ekspres (+ Rp. 25.000)',
  ];

  @override
  void initState() {
    super.initState();
    namaController.text = "Sultan Mahesa";
    alamatController.text = "Jl. Raya Penggilingan Cakung Jakarta Timur";
    kodePosController.text = "13978";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // Progress Stepper (dummy)
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 8),
                  Icon(Icons.credit_card, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle, size: 18, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Billing address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Nama Lengkap
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
            ),

            // Alamat
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),

            const SizedBox(height: 12),

            // Provinsi dan Kode Pos
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: provinsi,
                    decoration: const InputDecoration(labelText: 'Provinsi'),
                    items: provinsiList.map((String item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) => setState(() => provinsi = value),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: kodePosController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Pos Kode"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Negara
            DropdownButtonFormField<String>(
              value: negara,
              decoration: const InputDecoration(labelText: 'Negara'),
              items: negaraList.map((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) => setState(() => negara = value),
            ),

            const SizedBox(height: 12),

            // Opsi Pengiriman
            DropdownButtonFormField<String>(
              value: opsiPengiriman,
              decoration: const InputDecoration(labelText: 'Opsi Pengiriman'),
              items: opsiPengirimanList.map((String item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: (value) => setState(() => opsiPengiriman = value),
            ),

            const SizedBox(height: 12),

            // Checkbox
            CheckboxListTile(
              value: simpanAlamat,
              onChanged: (value) => setState(() => simpanAlamat = value!),
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Simpan detail untuk alamat penagihan di masa mendatang",
                style: TextStyle(fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 20),

            // Tombol
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Aksi lanjut ke pembayaran
              },
              child: const Text(
                "Lanjutkan ke Pembayaran",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
