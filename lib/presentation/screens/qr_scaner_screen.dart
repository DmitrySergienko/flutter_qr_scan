import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() => runApp(const MaterialApp(home: QrScanerScreen()));

class QrScanerScreen extends StatefulWidget {
  const QrScanerScreen({super.key});

  @override
  _QrScanerScreenState createState() => _QrScanerScreenState();
}

class _QrScanerScreenState extends State<QrScanerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Do something with the scanned data (e.g. navigate to another screen or display some feedback)
      print('QR Code scanned: ${scanData.code}');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
