import 'package:flutter/material.dart';
import 'package:qr_scan/presentation/widgets/news_content.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildNewsContent('assets/images/image_one.png'),
          _buildNewsContent('assets/images/image_two.png'),
          _buildNewsContent('assets/images/image_one.png'),
        ],
      ),
    );
  }

  Widget _buildNewsContent(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NewsContent(imagePath: imagePath),
    );
  }
}
