import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          child: Text(
            "Template CaterSmart Siap! Silakan Orang B mulai ngoding UI.",
          ),
        ),
      ),
    );
  }
}
