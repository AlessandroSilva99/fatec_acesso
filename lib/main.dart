// lib/main.dart
import 'package:flutter/material.dart';
import 'views/selection_screen.dart';
import 'views/gerar_qr_screen.dart';
import 'views/exibir_qr_screen.dart';
import 'views/scan_qr_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fatec Acesso',
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const SelectionScreen(),

      routes: {
        '/selection': (context) => const SelectionScreen(),

        '/gerarQr': (context) => const GerarQrScreen(),
        '/exibirQr': (context) => const ExibirQrScreen(),
        '/scanQr': (context) => const ScanQrScreen(),
      },
    );
  }
}
