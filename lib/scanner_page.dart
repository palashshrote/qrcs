import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_page.dart';
import 'package:qrcs/result_page.dart';
import 'package:qrcs/bad_response.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  bool _isScanning = true;

  @override
  void reassemble() {
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.brown,
        title: const Text('Device Validator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            onPressed: () async {
              await controller?.toggleFlash();
            },
          ),
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: () async {
              await controller?.flipCamera();
            },
          ),
          IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () async {
              await controller?.pauseCamera();
            },
          ),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () async {
              await controller?.resumeCamera();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Type: ${describeEnum(result!.format)}'),
                        Text('Data: ${result!.code}'),
                      ],
                    )
                  : const Text(
                      'Scan a code',
                      style: TextStyle(fontSize: 20),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (_isScanning) {
        setState(() {
          result = scanData;
          _isScanning = false; // Stop scanning further
        });
        await controller.pauseCamera();

        // Fetch data using the API key
        // String? apiKey = scanData.code;
        String? qrData = scanData.code;
        List<String>? parts = qrData?.split('&');
        if (parts!.length < 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BadResponse()),
          );
        } else {
          String cId = parts[0];
          String readApi = parts[1];
          String writeApi = parts[2];

          var response = await fetchApiData(cId, readApi, writeApi);
          if (response.isEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BadResponse()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(data: response)),
            );
          }
        }
      }
    });
  }

  Future<Map<String, dynamic>> fetchApiData(
      String cId, String readApi, String writeApi) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.thingspeak.com/channels/$cId/feeds.json?api_key=$readApi&results=1'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      return {};
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
