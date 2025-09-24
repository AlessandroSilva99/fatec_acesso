import 'package:flutter/material.dart';

class AcessoNegadoScreen extends StatelessWidget {
  const AcessoNegadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          "ACESSO NEGADO",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
