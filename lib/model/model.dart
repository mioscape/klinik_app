class Pegawai {
  final int id;
  final String nip;
  final String nama;
  final String tanggalLahir;
  final String nomorTelepon;
  final String email;
  final String password;

  Pegawai({
    required this.id,
    required this.nip,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.email,
    required this.password,
  });
}

class Pasien {
  final int id;
  final String nomorRm;
  final String nama;
  final String tanggalLahir;
  final String nomorTelepon;
  final String alamat;

  Pasien({
    required this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });
}
