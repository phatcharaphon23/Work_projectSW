import 'package:flutter/material.dart';
import 'package:packing/utility/my_constant.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class PackgingScreen extends StatefulWidget {
  const PackgingScreen({Key? key}) : super(key: key);

  @override
  _PackgingScreenState createState() => _PackgingScreenState();
}

class _PackgingScreenState extends State<PackgingScreen> {
  List<dynamic> conntries = [];
  List<dynamic> statesMasters = [];
  List<dynamic> today = [];

  String? countryId;
  String? stateId;
  String? todayId;

  @override
  void initState() {
    super.initState();

    this.conntries.add({"id": 1, "name": "Simple"});
    this.conntries.add({"id": 2, "name": "Variable"});
    this.conntries.add({"id": 3, "name": "haha"});
    this.statesMasters.add({"id": 01, "name": "1"});
    this.statesMasters.add({"id": 02, "name": "2"});
    this.statesMasters.add({"id": 03, "name": "3"});
    this.today.add({"id": 001, "name": "1"});
    this.today.add({"id": 002, "name": "2"});
    this.today.add({"id": 003, "name": "3"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Myconstant.dark,
        elevation: 0,
        title: Text(
          "เพิ่มข้อมูลลงกล่องยา",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              FormHelper.dropDownWidgetWithLabel(
                context,
                "ชื่อยา",
                "Select Country",
                this.countryId,
                this.conntries,
                (onChangedVal) {
                  this.countryId = onChangedVal;
                  print("Selected Country : $onChangedVal");
                },
                (onValidateVal) {
                  if (onValidateVal == null) {
                    return 'Pleagse Select Country';
                  }
                  return null;
                },
                borderColor: Myconstant.light,
                borderFocusColor: Myconstant.light,
                borderRadius: 15,
                optionValue: "id",
                optionLabel: "name",
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "เลือก Lot ยา",
                "เลือก Lot ยา",
                this.stateId,
                this.statesMasters,
                (onChangedVal) {
                  this.countryId = onChangedVal;
                  print("Selected Country : $onChangedVal");
                },
                (onValidateVal) {
                  if (onValidateVal == null) {
                    return 'Pleagse Select Country';
                  }
                  return null;
                },
                borderColor: Myconstant.light,
                borderFocusColor: Myconstant.light,
                borderRadius: 15,
                optionValue: "id",
                optionLabel: "name",
              ),
              FormHelper.dropDownWidgetWithLabel(
                context,
                "วันหมดอายุ",
                "วันที่"
                    "วันหมดอายุ",
                this.stateId,
                this.statesMasters,
                (onChangedVal) {
                  this.countryId = onChangedVal;
                  print("Selected Country : $onChangedVal");
                },
                (onValidateVal) {
                  if (onValidateVal == null) {
                    return 'Pleagse Select Country';
                  }
                  return null;
                },
                borderColor: Myconstant.primary,
                borderFocusColor: Myconstant.light,
                borderRadius: 15,
                optionValue: "id",
                optionLabel: "name",
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: FormHelper.submitButton(
                  "เพิ่มลงกล่อง",
                  () {},
                  btnColor: Myconstant.dark,
                  borderColor: Myconstant.dark,
                  txtColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
