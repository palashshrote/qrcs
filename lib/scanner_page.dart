import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_page.dart';
import 'bad_response.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR'); // key helps identifying
  QRViewController? controller; //controlling the state of camera view
  Barcode?
      result; //contains property like code will be used for storing code data,
  //  format will be used for storing code type

  bool _isScanning = true; //identifying current state of camera

  @override
  void reassemble() {
    //called whenever app is reloaded,
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller?.pauseCamera();
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanning'),
        //4 icon button (toggle flash, switch camera, pause and resume camera)
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
            //for displaying the extracted data on the screen
            flex: 1,
            child: Center(
              //used ternary operator to display the data based on the condition
              //initially when user haven't performed the scan the result is empty //it should only display the result after scan is performed
              child: (result != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center, //center view
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
    //creation and management of a QR code scanner
    this.controller = controller; //setting the controller
    controller.scannedDataStream.listen((scanData) async {
      //Whenever a QR code is scanned, the scanData parameter will contain the scanned data.
      if (_isScanning) {
        //initailly when scanner page loads up, the camera is acivated and isScanning is true...
        setState(() {
          result = scanData; //storing the qr scanned data in result variable
          _isScanning = false; // Stop scanning further
        });
        await controller.pauseCamera(); //pause the camera

        //Data extraction computation.
        //As user have embedded data using 2'&'
        //The 1st part is channelId, 2nd ReadApi, 3rd WriteApi
        String? qrData = scanData.code;
        List<String>? parts = qrData?.split('&');
        if (parts!.length < 3) {
          //if user don't get above 3 info ==> then user've scanned wrong qr
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BadResponse()),
          );
        } else {
          //storing info into variables
          String cId = parts[0];
          String readApi = parts[1];
          String writeApi = parts[2];

          //storing http request using fetchApiData in variable
          var response = await fetchApiData(cId, readApi, writeApi);
          if (response.isEmpty) {
            //if response is empty ==> may arise if the device doesn't contain data
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BadResponse()),
            );
          } else {
            //received JSON and calling ResultPage passing response as
            //a parameter for displaying the results
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

  //The purpose of "fetchApiData" code is to fetch the latest feed from a specified Thingspeak channel. The http.get request sends a GET request to the Thingspeak API with the specified channel ID and API key, and the response is stored in the response variable.
  Future<Map<String, dynamic>> fetchApiData(
      String cId, String readApi, String writeApi) async {
    //making http request in try catch block for handling exceptions,
    //if valid then the function returns a Future<Map<String, dynamic>>, which means it returns a Future that resolves to a Map with String keys and dynamic values.
    //if invalid the it return empty <Map<>>
    try {
      //using http package to make GET request from ThinkSpeak Api
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

  //remove widget from widget tree  disposes of the QRViewController instance
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
