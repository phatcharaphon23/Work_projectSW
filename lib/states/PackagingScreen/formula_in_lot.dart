import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot_detail.dart';
import 'package:packing/states/PackagingScreen/home_packaging.dart';
import 'package:packing/states/PackagingScreen/pick_formula_in_lot.dart';
import 'package:packing/utility/my_constant.dart';

class FormulaInLotScreen extends StatefulWidget {
  final int? lotID;
  final String? lotNo;
  final List<LotDetail>? lotDetails;
  FormulaInLotScreen({
    this.lotID,
    this.lotNo,
    this.lotDetails,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<FormulaInLotScreen> {
  List<LotDetail> lotDetails = [];
  int lotID = 0;
  String lotNo = "";

  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var ld in lotDetails) {
      if (ld.status == "PACKED") {}
      var l = ListTile(
        title: Text(ld.productName!),
        subtitle: Text(ld.productModel!),
        trailing: Text(ld.dateExt!),
        onTap: () {},
        // onTap: () {
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //       title: Text('Details'),
        //       backgroundColor: Colors.white,
        //       content: SizedBox(
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
    return list;
  }

  @override
  void initState() {
    super.initState();
    lotDetails = (widget.lotDetails ?? []).toList();
    lotID = (widget.lotID)!;
    lotNo = (widget.lotNo)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Lot: ${lotNo}"),
        actions: [
          IconButton(
              onPressed: () async {
                List<History>? historys = await History.getHistory();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PickForMulaInLotScreen(
                              lotID: lotID,
                              lotNo: lotNo,
                              history: historys,
                            )));
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                await Lot.confirmLot(lotID);
                List <Lot>? lots = await Lot.getLot();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LotPage(
                              lots: lots,
                            )));
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }

  Future refreshSceen() async {
    List<LotDetail>? lotDetailsrefersh = await LotDetail.getLotDetail(lotID);
    setState(() {
      try {
        lotDetails = lotDetailsrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
