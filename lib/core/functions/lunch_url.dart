import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchUrl(String url, BuildContext context) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Preview Not Avaliable')));
    }
  }
}
