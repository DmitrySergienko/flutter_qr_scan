import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // makes the width occupy the maximum space
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0x26ffffff),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: const Row(
        children: [
          Expanded(
            child: Text(
              "Поиск",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Icon(
            Icons.search,
            size: 26.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
