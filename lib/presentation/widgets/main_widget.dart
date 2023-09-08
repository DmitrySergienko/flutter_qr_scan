import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/categories_screen.dart';
import 'package:qr_scan/presentation/widgets/news_widget.dart';
import 'package:qr_scan/presentation/widgets/tile_widget.dart';

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
        width: double.infinity,
        height: 616,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Color(0xfff4f5fa),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const TitleWidget(
              title: 'ИЗБРАННОЕ',
              icon: null,
            ),
            const SizedBox(height: 10),
            const CategoriesScreen(),
            const SizedBox(height: 10),
            const TitleWidget(
              title: 'НОВОСТИ',
              icon: Icon(Icons.arrow_forward_ios, color: Color(0xFF8A898E)),
            ),
            const SizedBox(height: 10),
            NewsWidget()
          ],
        ),
      ),
    );
  }
}
//const 