import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:packing/models/formula_detail.dart';
import 'package:packing/utility/my_constant.dart';

class InformationScreen extends StatefulWidget {
  final List<ForMula>? formulardetails;
  InformationScreen({
    this.formulardetails,
  });

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  List<ForMula> formulardetails = [];

  @override
  void initState() {
    super.initState();
    formulardetails = (widget.formulardetails ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${formulardetails[0].productName}",
                              style: GoogleFonts.charmonman(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "ประเภท: ${formulardetails[0].productModel}",
                            style: GoogleFonts.charmonman(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ระยะเวลาในการเก็บรักษา: ${formulardetails[0].ext} วัน",
                            style: GoogleFonts.charmonman(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ส่วนประกอบ: ${formulardetails[0].componet}",
                            style: GoogleFonts.charmonman(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ปริมาตร: ${formulardetails[0].quantity} กรัม",
                            style: GoogleFonts.charmonman(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ข้อบ่งชี้:",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                               Text(
                                "${formulardetails[0].indication}",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ผู้ผลิต:",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                               Text(
                                "${formulardetails[0].maufacturer}",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ใบอนุญาติ: ${formulardetails[0].license}",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "รายละเอียด:",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                               Text(
                                "${formulardetails[0].detail}",
                                style: GoogleFonts.charmonman(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
