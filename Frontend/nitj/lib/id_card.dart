import 'package:flutter/material.dart';
import 'package:nitj/my_image.dart';
import 'dart:math';

class IdCard extends StatelessWidget {
  final String rno;
  final String? name;
  final String? fName;
  final String? course;
  final String? dob;
  final String? phone;
  final String? bGgroup;
  const IdCard({
    super.key,
    required this.rno,
    required this.name,
    required this.fName,
    required this.course,
    required this.dob,
    required this.phone,
    required this.bGgroup,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double cardHeight = screenHeight * 0.7;
    double cardWidth = cardHeight / 1.586;

    return Center(
      child: OverflowBox(
        maxWidth: screenHeight,
        maxHeight: screenWidth,
        child: Transform.rotate(
          angle: pi / 2,
          child: SizedBox(
            width: cardHeight,
            height: cardWidth,
            child: AspectRatio(
              aspectRatio: 1.586,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: cardWidth * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 10, 105, 183),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: MyImage(
                              imageUrl:
                                  "https://nitj.ac.in/public/assets/images/logo_250.png",
                              height: double.maxFinite,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 1,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Dr. B.R. Ambedkar National Institute of Technology Jalandhar",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Jalandhar - 144008, Punjab (India)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "(An Autonomous Institute of Ministry of Education, Govt. of India)",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Phone No. - 0181-2690301, 2690302",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double containerHeight =
                                      constraints.maxHeight * 0.8;
                                  double containerWidth =
                                      containerHeight / 1.285;

                                  return Container(
                                    width: containerWidth,
                                    height: containerHeight,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: const Icon(Icons.person),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: Table(
                                // border: TableBorder.all(),
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(2),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Roll No.",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(rno),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(name ?? "----- -----"),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Father's Name",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(fName ?? "----- -----"),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Course",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(course ?? "- - -"),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Date of Birth",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(dob ?? "--/--/----"),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(phone ?? "XXXXX-XXXXX"),
                                      ),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "Blood Group",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(bGgroup ?? "---"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
