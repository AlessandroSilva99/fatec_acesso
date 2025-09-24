import 'package:flutter/material.dart';

class AcessoPermitidoScreen extends StatelessWidget {
  const AcessoPermitidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "ACESSO PERMITIDO",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
