import 'package:flutter/material.dart';
import 'package:qrcs/scanner_page.dart';
import 'package:qrcs/home_page.dart';
import 'package:qrcs/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/scanner': (context) => const ScannerPage(),
        '/result': (context) => const ResultPage(data: {}),
      },
    );
  }
}
