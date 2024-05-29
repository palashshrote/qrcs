import 'package:flutter/material.dart';
import 'scanner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? codeType;
  String? codeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('QR Code Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ScannerPage()),
            );
          },
          child: Text('Scan QR Code'),
        ),
      ),
    );
  }
}
