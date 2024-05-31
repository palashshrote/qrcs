import 'package:flutter/material.dart';
import 'scanner_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //stores the value of extracted data from QR
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
                onPressed: () async {
                  //functionality of button when tapped that is it should go to scanner_page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScannerPage()),
                  );
                },
                child: const Text('Scan a Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
