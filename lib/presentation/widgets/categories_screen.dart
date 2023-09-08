import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scan/presentation/widgets/category_batton.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryButton(
          title: 'Мои платежи',
          icon: Icon(Icons.wallet, color: Colors.blue),
        ),
        CategoryButton(
          title: 'Билеты',
          icon: Icon(Icons.airplane_ticket, color: Colors.blue),
        ),
        CategoryButton(
          title: 'Карты лояльности',
          icon: Icon(Icons.credit_card, color: Colors.blue),
        ),
        CategoryButton(
          title: 'QR-оплата',
          icon: Icon(Icons.qr_code_scanner, color: Colors.blue),
        ),
      ],
    );
  }
}
