import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // TAMBAHAN 1: Import Hive

// TAMBAHAN 2: Ubah main() menjadi async karena proses database butuh waktu tunggu
void main() async { 
  // TAMBAHAN 3: Baris wajib jika main() menggunakan async
  WidgetsFlutterBinding.ensureInitialized(); 
  
  // TAMBAHAN 4: Menyiapkan dan membuka folder database lokal untuk keranjang
  await Hive.initFlutter();
  await Hive.openBox('cart_box'); 

  runApp(const CaterSmartApp());
}

class CaterSmartApp extends StatelessWidget {
  const CaterSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaterSmart',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Tema warna dasar katering
      ),
      home: const Scaffold(
        body: Center(
          child: Text("Template CaterSmart Siap! Silakan Orang B mulai ngoding UI."),
        ),
      ),
    );
  }
}