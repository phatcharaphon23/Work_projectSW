import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ranya/utility/my_constant.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class PackgingScreen extends StatefulWidget {
  const PackgingScreen({Key? key}) : super(key: key);

  @override
  _PackgingScreenState createState() => _PackgingScreenState();
}

class _PackgingScreenState extends State<PackgingScreen> {
  List<dynamic> conntries = [];

  String? countryId;

  @override
  void initState() {
    super.initState();

    this.conntries.add({"id": 1, "name": "Simple"});
    this.conntries.add({"id": 2, "name": "Variable"});
    this.conntries.add({"id": 3, "name": "haha"});
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FormHelper.dropDownWidget(
              context,
              "Select Country",
              this.countryId,
              this.conntries,
              (opnChangedVal) {
                this.countryId = opnChangedVal;
                print("Selected Country : $opnChangedVal");
              },
              (onValidateVal) {
                if (onValidateVal == null) {
                  return 'Pleagse Select Country';
                }
                return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "name",
            )
          ],
        ),
      ),
    );
  }
}
