import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nitj/fetch.dart';
import 'package:nitj/id_card.dart';

class InfoPage extends StatefulWidget {
  final String rno;
  const InfoPage({super.key, required this.rno});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Map<String, String> data = {};

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async {
    final Map<String, dynamic> response = await fetch(
      'https://nitj-barcode.onrender.com/students/${widget.rno}',
      {},
      "GET",
    );
    if (response.isNotEmpty) {
      print(jsonEncode(response));
      setState(() {
        data = {
          "name": response["name"] ?? "null",
          "course": response["branch"] ?? "null",
        };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ID Card"), centerTitle: true),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: IdCard(
            rno: widget.rno,
            name: data['name'],
            course: data['course'],
            phone: data['phone'],
            bGgroup: data['bGroup'],
            dob: data['dob'],
            fName: data['fName'],
          ),
        ),
      ),
    );
  }
}
