import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


  void launchUrls(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception("Unable to launch $url");
    }
  }