import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  // Alat untuk menyimpan data ke memori rahasia HP
  static const _storage = FlutterSecureStorage();

  // Simpan Token & Data User setelah login sukses
  static Future<void> saveSession(String token, String nama) async {
    await _storage.write(key: 'session_token', value: token);
    await _storage.write(key: 'user_nama', value: nama);
  }

  // Cek apakah user sudah login atau belum
  static Future<bool> isLoggedIn() async {
    String? token = await _storage.read(key: 'session_token');
    return token != null; // Jika ada token, berarti sudah login
  }

  // Ambil nama user untuk dipajang di profil
  static Future<String?> getNamaUser() async {
    return await _storage.read(key: 'user_nama');
  }

  // Hapus session saat Logout
  static Future<void> logout() async {
    await _storage.deleteAll();
  }
}