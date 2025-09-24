import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ExibirQrScreen extends StatelessWidget {
  const ExibirQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Aqui você pode trocar pelos dados reais do aluno
    const String qrData = "Aluno: João Silva | RA: 123456 | Curso: ADS";

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Seu QR Code",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 250.0,
            ),
            const SizedBox(height: 30),
            const Text(
              "Mostre este QR Code para entrar",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
