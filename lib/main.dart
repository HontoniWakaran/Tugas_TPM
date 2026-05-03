import 'package:flutter/material.dart';

void main() {
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