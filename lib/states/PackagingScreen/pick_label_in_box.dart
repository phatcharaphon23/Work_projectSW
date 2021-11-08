import 'package:flutter/material.dart';
import 'package:packing/models/box_detail.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot_detail.dart';
// import 'package:packing/models/lot_detail.dart';
// import 'package:packing/states/PackagingScreen/formula_in_lot.dart';
// import 'package:packing/states/PackagingScreen/pick_formula_in_lot.dart';
import 'package:packing/states/packaging_screengg.dart';
import 'package:packing/utility/my_constant.dart';

class PickLabelInBoxScreen extends StatefulWidget {
  final List<LotDetail>? formulas;
  final int? lotID;
  final String? lotNo;
  final int? boxID;
  PickLabelInBoxScreen({this.formulas, this.lotID, this.lotNo, this.boxID});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<PickLabelInBoxScreen> {
  List<LotDetail> formulas = [];
  int lotID = 0;
  String lotNo = "";
  int boxID = 0;
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var formula in formulas) {
      if (formula.historyStatus == "ADDLOT") {
        var l = ListTile(
          title: Text(formula.productName!),
          subtitle: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ext: ${formula.dateExt!}"),
                  Text("ประเภท: ${formula.productModel!}"),
                ],
                //
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () async {
                await BoxDetail.addBoxDetail(boxID, lotID, formula.formulaID!);
                refreshSceen();
              },
              icon: Icon(Icons.add)),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PickLotInLotScreen()));
          },
          // onTap: () {
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) => AlertDialog(
          //       title: Text('Details'),
          //       backgroundColor: Colors.white,
          //       content: SizedLot(
          //         width: 400.0,
          //         height: 100.0,
          //         child: Column(
          //           children: [Text("เพิ่มลงกล่อง")],
          //         ),
          //       ),
          // actions: <Widget>[
          // TextButton(
          //   child: Text('Add'),
          //   style: TextButton.styleFrom(
          //     primary: Colors.white,
          //     backgroundColor: Colors.blueGrey,
          //   ),
          // onPressed: () => {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => InformationScreen(),
          //     ),
          //   )
          // },
          // ),
          //       TextButton(
          //           child: Text('Close'),
          //           style: TextButton.styleFrom(
          //             primary: Colors.white,
          //             backgroundColor: Colors.blueGrey,
          //           ),
          //           onPressed: () {
          //             Navigator.pop(context);
          //           }),
          //     ],
          //   ),
          // );
          // },
        );
        list.add(l);
      }
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    formulas = (widget.formulas ?? []).toList();
    lotID = (widget.lotID)!;
    lotNo = (widget.lotNo)!;
    boxID = (widget.boxID)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("select formula in lot"),
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }

  Future refreshSceen() async {
    List<LotDetail>? formularefersh = await LotDetail.getLotDetail(lotID);
    setState(() {
      try {
        formulas = formularefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
