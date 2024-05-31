import 'package:flutter/material.dart';
import 'package:qrcs/result_page.dart';
import 'package:qrcs/scanner_page.dart';
import 'package:qrcs/home_page.dart';
import 'package:qrcs/bad_response.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/scanner': (context) => const ScannerPage(),
        '/result': (context) => const ResultPage(data: {}),
        '/badres': (context) => const BadResponse(),
        // '/result': (context) => const ResultPage(data: {}),
      },
    );
  }
}
