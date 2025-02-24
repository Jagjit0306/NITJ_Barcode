import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:nitj/info_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarcodeScannerScreen(),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  late final MobileScannerController
  _controller; // = MobileScannerController();
  bool _hasScanned = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = MobileScannerController();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return; // Prevent multiple scans

    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final String rollNo = barcodes.first.rawValue ?? '';
      if (rollNo.isNotEmpty && rollNo.length == 8) {
        setState(() {
          _hasScanned = true;
        });

        _controller.stop(); // Stop the scanner

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return InfoPage(rno: rollNo);
            },
          ),
        ).then((_) {
          setState(() {
            _hasScanned = false;
          });
          _controller.start(); // Resume scanning when returning
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Ensure proper cleanup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode'), centerTitle: true),
      body: MobileScanner(controller: _controller, onDetect: _onDetect),
    );
  }
}
