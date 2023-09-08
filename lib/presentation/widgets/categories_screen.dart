import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/category_batton.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CategoryButton(), // Now, the CategoryButton is inside a list.
        ],
      ),
    );
  }
}
