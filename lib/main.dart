import 'package:flutter/material.dart';
import 'package:qrcs/result_page2.dart';
import 'package:qrcs/scanner_page.dart';
import 'package:qrcs/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/scanner': (context) => const ScannerPage(),
        '/result': (context) => const ResultPage2(data: {}),
        // '/result': (context) => const ResultPage(data: {}),
      },
    );
  }
}
