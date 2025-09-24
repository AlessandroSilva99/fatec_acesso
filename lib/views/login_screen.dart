import 'package:flutter/material.dart';
import 'gerar_qr_screen.dart';
import 'scan_qr_screen.dart';

class LoginScreen extends StatelessWidget {
  final String perfil;

  const LoginScreen({super.key, required this.perfil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),

              // Logo
              Image.asset(
                'assets/logo_fatec_pb.png',
                width: 200,
              ),
              const SizedBox(height: 30),

              // Texto Login + Perfil
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                perfil, // "Aluno" ou "Segurança"
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),

              // Campo CPF
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "CPF",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),

              // Campo Senha
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  obscureText: true,
                ),
              ),

              const SizedBox(height: 40),

              // Botões Voltar e Entrar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botão Voltar
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Voltar"),
                    ),

                    // Botão Entrar
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                      onPressed: () {
                        if (perfil == "Aluno") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const GerarQrScreen(),
                            ),
                          );
                        } else if (perfil == "Segurança") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ScanQrScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text("Entrar"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
