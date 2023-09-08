import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherPage extends StatelessWidget {
  final String url;

  URLLauncherPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('URL Launcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Scanned URL:'),
            const SizedBox(height: 10),
            Text(url),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL('https://google.com'),
              child: const Text('Open in Browser'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
