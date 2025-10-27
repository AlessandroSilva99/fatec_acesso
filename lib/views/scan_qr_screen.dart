import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Row(
                children: [
                  Icon(Icons.person, size: 28),
                  SizedBox(width: 10),
                  Text("Nome do Segurança", style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.badge, size: 28),
                  SizedBox(width: 10),
                  Text("CPF: 123.456.789-00", style: TextStyle(fontSize: 18)),
                ],
              ),
              const Divider(),

              const ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text("Política de privacidade"),
              ),
              const ListTile(
                leading: Icon(Icons.star_rate),
                title: Text("Avaliar"),
              ),
              const Divider(),

              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configurações"),
              ),
              const ListTile(
                leading: Icon(Icons.accessibility_new),
                title: Text("Acessibilidade"),
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text("Sair da Conta",
                    style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context); 
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/selection',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.account_circle, size: 28),
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () async {
            final barcode = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const _QrScannerView(),
              ),
            );
            if (barcode != null && mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("QR Code lido: $barcode")),
              );
            }
          },
          child: const Text("Ler QR-Code"),
        ),
      ),
    );
  }
}

class _QrScannerView extends StatelessWidget {
  const _QrScannerView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leia o QR-Code")),
      body: MobileScanner(
        overlayBuilder: (context, constraints) => Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            Navigator.pop(context, barcodes.first.rawValue);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MobileScannerController().toggleTorch();
        },
        child: const Icon(Icons.flash_on),
      ),
    );
  }
}
