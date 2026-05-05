import 'package:hive_flutter/hive_flutter.dart';
import '../models/menu_model.dart';

class CartService {
  // Memanggil kotak penyimpanan Hive yang sudah kita buka di main.dart
  static final _cartBox = Hive.box('cart_box');

  // 1. Fungsi Menambah ke Keranjang
  static void addToCart(MenuModel menu, int jumlah) {
    // Kita ubah data menjadi format Map (kamus) agar mudah disimpan Hive
    Map<String, dynamic> itemPesanan = {
      'menu_id': menu.id,
      'nama': menu.nama,
      'harga': menu.harga,
      'gambar': menu.gambar,
      'jumlah': jumlah,
      'total_harga': menu.harga * jumlah,
    };

    // Menggunakan menu_id sebagai "kunci laci".
    // Jika user menambahkan menu yang sama, datanya akan tertimpa/ter-update (tidak dobel).
    _cartBox.put(menu.id, itemPesanan);
  }

  // 2. Fungsi Mengambil Seluruh Isi Keranjang
  static List<Map<dynamic, dynamic>> getCartItems() {
    // Mengambil semua nilai di dalam box dan mengubahnya menjadi bentuk List
    return _cartBox.values.toList().cast<Map<dynamic, dynamic>>();
  }

  // 3. Fungsi Menghapus Satu Item (Misal: User batal pesan Nasi Kotak)
  static void removeFromCart(int menuId) {
    _cartBox.delete(menuId);
  }

  // 4. Fungsi Mengosongkan Keranjang (Dipanggil SETELAH Checkout sukses ke XAMPP)
  static void clearCart() {
    _cartBox.clear();
  }
}
