import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF8A898E)),
          ),
          if (icon != null) icon!
        ],
      ),
    );
  }
}
