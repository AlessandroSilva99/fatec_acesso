import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ExibirQrScreen extends StatelessWidget {
  const ExibirQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: Image.asset(
            'assets/logo_fatec_pb.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: QrImageView(
          data: "12345678900", 
          version: QrVersions.auto,
          size: 250.0, 
        ),
      ),
    );
  }
}
