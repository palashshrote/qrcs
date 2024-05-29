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
        title: Text('QR Code Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScannerPage()),
                );
              },
              child: Text('Scan QR Code'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Code Type',
              ),
              readOnly: true,
              controller: TextEditingController(text: codeType),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Code Data',
              ),
              readOnly: true,
              controller: TextEditingController(text: codeData),
            ),
          ],
        ),
      ),
    );
  }
}
