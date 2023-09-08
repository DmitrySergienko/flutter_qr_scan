import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/balans_widget.dart';
import 'package:qr_scan/presentation/widgets/main_widget.dart';
import 'package:qr_scan/presentation/widgets/search_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key})
      : super(key: key); // corrected the key argument here

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;

    Widget content = Column(
      children: [
        const SizedBox(height: 10),
        BalanceWidget(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SearchWidget(),
        ),
        const SizedBox(height: 10),
        const MainWidget(),
      ],
    );
    return Container(
      color: primaryColor,
      child: content,
    );
  }
}
