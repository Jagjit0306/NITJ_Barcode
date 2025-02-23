import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class BarcodeScannerScreen extends StatelessWidget {
  const BarcodeScannerScreen({super.key});

  Future<void> fetchStudentData(BuildContext context, String rollNo) async {
    final String apiUrl = 'http://192.168.227.132:5002/students/$rollNo';

    try {
      print(apiUrl);
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> studentData = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(studentData: studentData),
          ),
        );
      } else {
        _showErrorDialog(context, 'Student not found');
      }
    } catch (error) {
      _showErrorDialog(context, 'Error fetching data. Please try again.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Barcode')),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String rollNo = barcodes.first.rawValue ?? '';
            if (rollNo.isNotEmpty) {
              fetchStudentData(context, rollNo);
            }
          }
        },
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> studentData;
  const ResultScreen({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Center(
        child:
            studentData.isNotEmpty
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Roll No: ${studentData["rollNo"] ?? "N/A"}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Name: ${studentData["name"] ?? "N/A"}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Branch: ${studentData["branch"] ?? "N/A"}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                )
                : const Text('No data found', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
