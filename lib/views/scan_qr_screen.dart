import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrScreen extends StatefulWidget {
  const ScanQrScreen({super.key});

  @override
  State<ScanQrScreen> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1, // borda leve
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // abrir menu lateral futuramente
          },
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
              // perfil futuramente
            },
          ),
        ],
      ),
      body: Center(
        child: qrText == null
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // abre a tela da câmera e aguarda o resultado (string)
                  final result = await Navigator.push<String?>(
                    context,
                    MaterialPageRoute(builder: (_) => const QrCameraScreen()),
                  );

                  if (result != null && mounted) {
                    setState(() {
                      qrText = result;
                    });
                  }
                },
                child: const Text("Ler QR-Code"),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "QR lido:",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    qrText!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        qrText = null;
                      });
                    },
                    child: const Text("Ler novamente"),
                  ),
                ],
              ),
      ),
    );
  }
}

/// Tela full-screen com a câmera e leitura usando mobile_scanner
class QrCameraScreen extends StatefulWidget {
  const QrCameraScreen({super.key});

  @override
  State<QrCameraScreen> createState() => _QrCameraScreenState();
}

class _QrCameraScreenState extends State<QrCameraScreen> {
  final MobileScannerController cameraController = MobileScannerController();
  bool _detected = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_detected) return; // evita múltiplos pops
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;
    final String? raw = barcodes.first.rawValue;
    if (raw == null || raw.isEmpty) return;

    _detected = true;
    // pare a câmera antes de voltar (se disponível)
    try {
      cameraController.stop();
    } catch (_) {}
    Navigator.of(context).pop(raw);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sem appBar — câmera full screen; mas tem uma overlay superior para controles
      body: Stack(
        children: [
          // Câmera 
          MobileScanner(
            controller: cameraController,
            onDetect: _onDetect,
          ),

          // Overlay superior com Voltar, Torch e Switch Camera
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Voltar
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      cameraController.stop();
                      Navigator.of(context).pop();
                    },
                  ),

                  // Controles à direita: flash e trocar câmera
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.flash_on, color: Colors.white),
                        onPressed: () async {
                          try {
                            await cameraController.toggleTorch();
                          } catch (_) {}
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.cameraswitch, color: Colors.white),
                        onPressed: () async {
                          try {
                            await cameraController.switchCamera();
                          } catch (_) {}
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Sugestão de área de leitura (opcional, central)
          Center(
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
