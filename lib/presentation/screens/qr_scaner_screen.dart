import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scan/presentation/screens/url_luncher_page.dart';

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
      final scannedURL = scanData.code;
      print('QR Code scanned: $scannedURL');

      // Pause the scanner
      controller.pauseCamera();

      _navigateToURLLauncherPage(scannedURL!);
    });
  }

  void _navigateToURLLauncherPage(String url) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => URLLauncherPage(url: url),
      ),
    );

    // Resume the scanner once back from URLLauncherPage
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
