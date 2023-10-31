import 'package:flutter/material.dart';
import 'package:klinik_app/model/model.dart';

class AddDataPage extends StatefulWidget {

  const AddDataPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddDataPageState createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nipController = TextEditingController();
  final TextEditingController _nomorRmController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _selectedType = 'Pegawai'; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Tambah Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButton<String>(
                value: _selectedType,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
                items: <String>['Pegawai', 'Pasien'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              if (_selectedType == 'Pegawai')
                TextFormField(
                  controller: _nipController,
                  decoration: const InputDecoration(labelText: 'NIP'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'NIP tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              if (_selectedType == 'Pasien')
                TextFormField(
                  controller: _nomorRmController,
                  decoration: const InputDecoration(labelText: 'Nomor RM'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nomor RM tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tanggalLahirController,
                decoration: const InputDecoration(labelText: 'Tanggal Lahir'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tanggal Lahir tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomorTeleponController,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor Telepon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              if (_selectedType == 'Pasien')
                TextFormField(
                  controller: _alamatController,
                  decoration: const InputDecoration(labelText: 'Alamat'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Alamattidak boleh kosong';
                    }
                    return null;
                  },
                ),
                if (_selectedType == 'Pegawai')
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                if (_selectedType == 'Pegawai')
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lakukan penyimpanan data ke database atau tempat penyimpanan lainnya
                    // Misalnya, tambahkan data baru ke daftar data (pegawaiList atau pasienList)
                    // atau kirimkan data ke server.
                    final data = _selectedType == 'Pegawai'
                        ? Pegawai(
                            id: 0,
                            nama: _namaController.text,
                            nip: _nipController.text,
                            tanggalLahir: _tanggalLahirController.text,
                            nomorTelepon: _nomorTeleponController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          )
                        : Pasien(
                            id: 0,
                            nama: _namaController.text,
                            nomorRm: _nomorRmController.text,
                            tanggalLahir: _tanggalLahirController.text,
                            nomorTelepon: _nomorTeleponController.text,
                            alamat: _alamatController.text,
                          );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data berhasil ditambahkan!'),
                      ),
                    );
                    // Kembali ke halaman sebelumnya
                    Navigator.pop(context, data);
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
