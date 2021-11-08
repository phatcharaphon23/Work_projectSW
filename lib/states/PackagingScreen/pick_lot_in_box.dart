import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot_detail.dart';
import 'package:packing/states/PackagingScreen/pick_label_in_box.dart';
// import 'package:packing/models/lot_detail.dart';
// import 'package:packing/states/PackagingScreen/formula_in_lot.dart';
// import 'package:packing/states/PackagingScreen/pick_formula_in_lot.dart';
import 'package:packing/states/packaging_screengg.dart';
import 'package:packing/utility/my_constant.dart';

class PickLotInBoxScreen extends StatefulWidget {
  final List<Lot>? lotBoxs;
  final boxID;
  PickLotInBoxScreen({
    this.lotBoxs,
    this.boxID
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<PickLotInBoxScreen> {
  List<Lot> lotBoxs = [];
  int boxID = 0;
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var lot in lotBoxs) {
      if (lot.status == "PACKED") {
        var l = ListTile(
          title: Text(lot.productLot!),
          subtitle: Text(lot.status!),
          // trailing: Text(lot.quantity.toString()),
          onTap: () async{
            List<LotDetail>? lotDetails = await LotDetail.getLotDetail(lot.id!);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PickLabelInBoxScreen(
                          lotID: lot.id!,
                          lotNo: lot.productLot!,
                          formulas: lotDetails,
                          boxID: boxID,
                        )));
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
    lotBoxs = (widget.lotBoxs ?? []).toList();
    boxID = (widget.boxID)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Lot ยา ที่ pack แล้ว"),
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }

  Future refreshSceen() async {
    List<Lot>? lotBoxrefersh = await Lot.getLot();
    setState(() {
      try {
        lotBoxs = lotBoxrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
