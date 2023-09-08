import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'ИЗБРАННОЕ',
          style: TextStyle(fontSize: 14, color: Color(0xFF8A898E)),
        ),
      ),
    );
  }
}
