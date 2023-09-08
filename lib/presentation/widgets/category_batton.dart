import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wallet),
            SizedBox(
                height: 8), // Optional: add a spacing between icon and text
            Text(
              'QR',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
