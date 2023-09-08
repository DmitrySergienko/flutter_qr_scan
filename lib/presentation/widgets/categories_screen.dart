import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/screens/qr_scaner_screen.dart';
import 'package:qr_scan/presentation/widgets/category_button.dart';
import 'package:permission_handler/permission_handler.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key); // Change made here

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _callQRScan() async {
    bool hasPermission = await requestCameraPermission();

    if (hasPermission) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => QrScanerScreen()),
      );
    } else {
      // Optionally inform the user that the camera permission is needed.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // Removed the const keyword
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CategoryButton(
          title: 'Мои платежи',
          icon: Icon(Icons.wallet, color: Colors.blue),
        ),
        const CategoryButton(
          title: 'Билеты',
          icon: Icon(Icons.airplane_ticket, color: Colors.blue),
        ),
        const CategoryButton(
          title: 'Карты лояльности',
          icon: Icon(Icons.credit_card, color: Colors.blue),
        ),
        CategoryButton(
          title: 'QR-оплата',
          icon: const Icon(Icons.qr_code_scanner, color: Colors.blue),
          onPressed: _callQRScan, // Change made here
        ),
      ],
    );
  }
}

Future<bool> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    status = await Permission.camera.request();
  }
  return status.isGranted;
}
