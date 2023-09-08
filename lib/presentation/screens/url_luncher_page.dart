import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherPage extends StatelessWidget {
  final String url;

  const URLLauncherPage({super.key, required this.url});

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
              onPressed: () => _launchURL(url),
              child: const Text('Open in Browser'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String my_url) async {
    final Uri url = Uri.parse(my_url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $my_url');
    }

    void _showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
