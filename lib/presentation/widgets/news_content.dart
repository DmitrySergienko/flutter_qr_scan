import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  final String imagePath;

  const NewsContent({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text
          const Positioned(
            left: 0,
            right: 0,
            bottom: 10, // Adjust this value to move text up or down
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Test text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black54,
                    )
                  ], // Shadow makes text more readable against the image
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
