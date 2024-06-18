import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrcs/result_page.dart';
import 'package:qrcs/scanner_page.dart';
import 'package:qrcs/home_page.dart';
import 'package:qrcs/bad_response.dart';
import 'package:qrcs/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp()); //entry point when application starts
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //constant constructor "MyApp", its instance is created at compile time
  //StatefulWidget class property "key" is passed as a constructor parameter
  //used for identifying widgets and manage their state efficiently.

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
