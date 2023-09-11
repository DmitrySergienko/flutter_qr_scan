import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
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
              onPressed: () async {
                try {
                  String deviceInfo = await _getDeviceInfo(context);
                  await _saveUrl(url, deviceInfo);
                  await _launchURL(url);
                } catch (e) {
                  _showErrorDialog(context, 'Failed to save URL: $e');
                }
              },
              child: const Text('Open in Browser'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String myUrl) async {
    final Uri url = Uri.parse(myUrl);

    if (!await launchUrl(url)) {
      throw Exception('Could not launch $myUrl');
    }
  }

  Future<void> _saveUrl(String myUrl, String deviceInfo) async {
    print('url: $myUrl');

    await FirebaseFirestore.instance.collection('user_uri').add({
      'createdAt': Timestamp.now(),
      'user_url': myUrl,
      'user_device_data': deviceInfo
    });
  }

  Future<String> _getDeviceInfo(BuildContext context) async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
        return 'Android Device:\n'
            'Device Brand: ${build.brand}\n'
            'Device Model: ${build.model}\n'
            'Android Version: ${build.version.release}';
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo data = await deviceInfoPlugin.iosInfo;
        return 'iOS Device:\n'
            'Device Name: ${data.name}\n'
            'Device Model: ${data.model}\n'
            'System Name: ${data.systemName}\n'
            'System Version: ${data.systemVersion}';
      } else {
        return 'Unknown platform';
      }
    } catch (e) {
      print('Failed to get device info: $e');
      return 'Failed to get device info';
    }
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
