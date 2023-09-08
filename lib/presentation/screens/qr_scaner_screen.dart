import 'package:flutter/material.dart';

class QrScanerScreen extends StatelessWidget {
  const QrScanerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          children: [Text('ИЗБРАННОЕ')],
        ),
      ),
    );
  }
}
