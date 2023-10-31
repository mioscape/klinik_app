import 'package:flutter/material.dart';
import 'package:klinik_app/view/data_list_page.dart';
import 'package:klinik_app/data/dummy.dart';
import 'package:klinik_app/view/add_data_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Menghilangkan logo "DEBUG"
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Klinik App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataListPage(pegawaiList, 'Pegawai'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Pegawai List'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataListPage(pasienList, 'Pasien'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 66, vertical: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Pasien List'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tampilkan halaman tambah data Pegawai
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddDataPage(''),
                  ),
                ).then((result) {
                  // Handle hasil dari halaman tambah data
                  if (result != null) {
                    // Lakukan sesuatu dengan data yang ditambahkan (result)
                    // Misalnya, tambahkan data ke pegawaiList atau kirimkan ke server.
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Ubah warna tombol
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text('Tambah Data'),
            ),
          ],
        ),
      ),
    );
  }
}