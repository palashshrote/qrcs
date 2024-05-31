import 'package:flutter/material.dart';
import 'package:qrcs/result_page.dart';
import 'package:qrcs/scanner_page.dart';
import 'package:qrcs/home_page.dart';
import 'package:qrcs/bad_response.dart';

void main() {
  runApp(MyApp()); //entry point when application starts
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      theme: ThemeData(
        brightness: Brightness.dark, //for dark theme
      ),
      initialRoute: '/', //navigating with named routes
      routes: {
        '/': (context) => const HomePage(),
        '/scanner': (context) => const ScannerPage(),
        '/result': (context) => const ResultPage(data: {}),
        '/badres': (context) => const BadResponse(),
      },
    );
  }
}
