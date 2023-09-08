import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scan/main.dart';
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
  bool isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // <-- Transparent AppBar
        elevation: 0, // <-- Remove shadow
        title: Text(
          'QR-оплата',
          style: TextStyle(color: Colors.white), // <-- White title text
        ),
        actions: [
          Icon(Icons.image, color: Colors.white), // <-- White color for icon
          Icon(Icons.bolt, color: Colors.white), // <-- White color for icon
        ],
        iconTheme: IconThemeData(
            color: Colors.white), // <-- White color for back button
      ),
      extendBodyBehindAppBar: true, // <-- Allow body to be behind AppBar
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        // <-- Make status bar icons white
        value: SystemUiOverlayStyle
            .light, // <-- This makes the status bar icons white
        child: Stack(
          children: <Widget>[
            Expanded(
              // <-- Wrap with Expanded
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.greenAccent,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 250,
                ),
              ),
            ),
            const Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Наведите камеру на QR-код',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: isScanning
                    ? ElevatedButton(
                        onPressed: () {
                          controller?.pauseCamera();
                          setState(() {
                            isScanning = false;
                          });
                        },
                        child: Text('Pause Scanning'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller?.resumeCamera();
                          setState(() {
                            isScanning = true;
                          });
                        },
                        child: Text('Resume Scanning'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final scannedURL = scanData.code;
      print('QR Code scanned: $scannedURL');

      if (isScanning) {
        // Pause the scanner
        controller.pauseCamera();
        setState(() {
          isScanning = false;
        });
        _navigateToURLLauncherPage(scannedURL!);
      }
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
    setState(() {
      isScanning = true;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
