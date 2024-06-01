import 'package:flutter/material.dart';
import 'scanner_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  //constant constructor, its instance is created at compile time
  //StatefulWidget class property "key" is passed as a constructor parameter
  //used for identifying widgets and manage their state efficiently.

  @override
  _HomePageState createState() => _HomePageState();
  //overrides createState method retuns instance of _HomePageState which manages the muatable state of HomePage
}

class _HomePageState extends State<HomePage> {
  //used for storing the value of extracted data from QR
  String? codeType;
  String? codeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Validator'),
      ),
      body: SizedBox.expand(
        //child widget(container) fills up all available space of parent widget(all excluding appbar )
        child: Container(
          decoration: const BoxDecoration(
            //for setting background image
            image: DecorationImage(
              image: AssetImage('assets/images/homeScr.png'),
              fit: BoxFit.cover, //for occupying full space of container
            ),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //adjusting column widgets into center
            children: [
              const SizedBox(
                //for pushing button down from center
                height: 200,
              ),
              ElevatedButton(
                //Scan button
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[700],
                  shape: const StadiumBorder(), //makes the edges circular
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),

                //functionality of button when tapped that is it should route to scanner_page
                onPressed: () async {
                  //for checking network connectivity
                  var connectivityResult =
                      await (Connectivity().checkConnectivity());

                  if (connectivityResult == ConnectivityResult.none) {
                    Fluttertoast.showToast(
                      msg:
                          "No network connection. Please connect to a network and try again.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Color.fromARGB(255, 4, 74, 100),
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ScannerPage()),
                    );
                  }
                },
                child: const Text('Scan device QR code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
