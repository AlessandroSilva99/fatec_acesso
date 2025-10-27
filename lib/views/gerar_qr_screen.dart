import 'package:flutter/material.dart';

class GerarQrScreen extends StatelessWidget {
  const GerarQrScreen({super.key});

  void _openMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, 
      builder: (BuildContext context) {
        final double screenWidth = MediaQuery.of(context).size.width;
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.white,
            child: Container(
              width: screenWidth * 0.8, 
              height: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Row(
                    children: [
                      Icon(Icons.person, color: Colors.black54),
                      SizedBox(width: 10),
                      Text(
                        "Nome do Aluno",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.badge, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("CPF", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Divider(height: 30),


                  const Row(
                    children: [
                      Icon(Icons.privacy_tip, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Política de Privacidade"),
                    ],
                  ),
                  const SizedBox(height: 16),


                  const Row(
                    children: [
                      Icon(Icons.star_rate, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Avaliar"),
                    ],
                  ),
                  const Divider(height: 30),

                  const Row(
                    children: [
                      Icon(Icons.settings, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Configurações"),
                    ],
                  ),
                  const SizedBox(height: 16),


                  const Row(
                    children: [
                      Icon(Icons.accessibility_new, color: Colors.black54),
                      SizedBox(width: 10),
                      Text("Acessibilidade"),
                    ],
                  ),
                  const Divider(height: 30),


                InkWell(
  onTap: () {
    final navigator = Navigator.of(context);
    navigator.pop(); 
    Future.delayed(const Duration(milliseconds: 200), () {
      navigator.pushNamedAndRemoveUntil(
        '/selection',
        (Route<dynamic> route) => false,
      );
    });
  },
  child: const Row(
    children: [
      Icon(Icons.logout, color: Colors.red),
      SizedBox(width: 10),
      Text("Sair da Conta", style: TextStyle(color: Colors.red)),
    ],
  ),
),



                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () => _openMenu(context), 
        ),
        title: Image.asset(
          'assets/logo_fatec_pb.png',
          height: 40,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    textStyle: const TextStyle(fontSize: 20),
  ),
  onPressed: () {
    Navigator.pushNamed(context, '/exibirQr');
  },
  child: const Text("Gerar QR-Code"),
),
      ),
    );
  }
}
