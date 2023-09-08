import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/categories_screen.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidget();
}

class _MainWidget extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 375,
        height: 616,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                20), // You can change the value to what you want
            topRight: Radius.circular(
                20), // Same value as topLeft for symmetrical corners
          ),
          color: Color(0xfff4f5fa),
        ),
        child: Card(
          child: Column(
            children: [CategoriesScreen()],
          ),
        ),
      ),
    );
  }
}
