import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  // 1. Fungsi untuk Daftar Akun (Register)
  static Future<Map<String, dynamic>> register(
    String nama,
    String email,
    String password,
  ) async {
    final url = Uri.parse('${Constants.baseUrl}/register.php');

    try {
      final response = await http.post(
        url,
        body: {'nama': nama, 'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Mengubah JSON jadi format Dart
      } else {
        return {"status": "error", "pesan": "Gagal terhubung ke server"};
      }
    } catch (e) {
      return {"status": "error", "pesan": "Error koneksi: $e"};
    }
  }

  // 2. Fungsi untuk Login
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final url = Uri.parse('${Constants.baseUrl}/login.php');

    try {
      final response = await http.post(
        url,
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {"status": "error", "pesan": "Gagal terhubung ke server"};
      }
    } catch (e) {
      return {"status": "error", "pesan": "Error koneksi: $e"};
    }
  }

  // 3. Fungsi untuk Mengambil Daftar Menu Katering
  static Future<List<dynamic>> getMenus() async {
    final url = Uri.parse('${Constants.baseUrl}/get_menu.php');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Balasan dari get_menu.php adalah list/array
        return json.decode(response.body);
      } else {
        return []; // Kalau gagal, kembalikan list kosong
      }
    } catch (e) {
      print("Error ambil menu: $e");
      return [];
    }
  }

  // --- LANJUTAN FUNGSI API EKSTERNAL ---

  // 4. Fungsi AI Gemini (Smart Menu Planner)
  static Future<String> tanyaGemini(String prompt) async {
    // Ganti dengan API Key aslimu yang kemarin didapat dari Google AI Studio
    const String apiKey = "ISI_API_KEY_GEMINI_KAMU_DI_SINI";
    final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$apiKey');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "contents": [
            {
              "parts": [
                {
                  "text": "Kamu adalah asisten perencana katering CaterSmart. Jawab pertanyaan user berikut dengan ramah dan hitungkan estimasi budgetnya: $prompt"
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Mengambil teks jawaban AI dari struktur JSON Gemini
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return "Maaf, asisten pintar sedang sibuk. Coba lagi nanti.";
      }
    } catch (e) {
      return "Gagal terhubung ke AI: $e";
    }
  }

  // 5. Fungsi Konversi Mata Uang (Frankfurter API)
  static Future<Map<String, dynamic>> convertCurrency(int amountIDR) async {
    final url = Uri.parse(
        'https://api.frankfurter.app/latest?amount=$amountIDR&from=IDR&to=USD,EUR,GBP');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } catch (e) {
      print("Error konversi uang: $e");
    }
    return {};
  }

  // 6. Fungsi Cek Waktu Lintas Zona (TimeAPI.io)
  static Future<String> getWaktuZona(String zona) async {
    // Contoh zona: "Europe/London" atau "Asia/Jakarta"
    final url = Uri.parse(
        'https://timeapi.io/api/Time/current/zone?timeZone=$zona');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['time']; // Mengambil jam saja (contoh: "14:30")
      }
    } catch (e) {
      print("Error ambil waktu: $e");
    }
    return "--:--";
  }
}
