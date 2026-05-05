class MenuModel {
  final int id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String gambar; // Menyimpan nama file gambar (opsional)

  // Constructor
  MenuModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  // Fungsi "Sihir" untuk mengubah JSON (Map) menjadi Objek MenuModel
  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: int.tryParse(json['id'].toString()) ?? 0, 
      // Sesuaikan dengan nama kolom di database: 'nama_makanan'
      nama: json['nama_makanan'] ?? 'Tanpa Nama', 
      harga: int.tryParse(json['harga'].toString()) ?? 0,
      deskripsi: json['deskripsi'] ?? '-',
      // Sesuaikan dengan nama kolom di database: 'gambar_url'
      gambar: json['gambar_url'] ?? '', 
    );
  }

  // Fungsi kebalikannya: mengubah Objek menjadi JSON (Berguna kalau mau simpan ke Hive)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'deskripsi': deskripsi,
      'gambar': gambar,
    };
  }
}
