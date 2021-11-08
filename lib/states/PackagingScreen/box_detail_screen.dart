import 'package:flutter/material.dart';
import 'package:packing/states/PackagingScreen/pick_lot_in_box.dart';
import 'package:packing/models/box.dart';
import 'package:packing/models/box_detail.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/states/PackagingScreen/box_screen.dart';
// import 'package:packing/states/PackagingScreen/pick_lot_in_box.dart';
// import 'package:packing/models/boxdetail_detail.dart';
// import 'package:packing/states/PackagingScreen/formula_in_boxdetail.dart';
// import 'package:packing/states/PackagingScreen/pick_formula_in_boxdetail.dart';
import 'package:packing/utility/my_constant.dart';

class BoxDetailScreen extends StatefulWidget {
  final List<BoxDetail>? boxdetails;
  final int? boxID;
  final String? boxNo;
  BoxDetailScreen({
    this.boxdetails,
    this.boxID,
    this.boxNo,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<BoxDetailScreen> {
  List<BoxDetail> boxdetails = [];
  int boxID = 0;
  String boxNo = "";
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var boxdetail in boxdetails) {
      var l = ListTile(
        title: Text(boxdetail.productName!),
        subtitle: Wrap(
          children: [
            Column(
              children: [
                Text(boxdetail.productModel!),
              ],
            )
          ],
        ),
        trailing: Text(boxdetail.dateExt.toString()),
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    boxdetails = (widget.boxdetails ?? []).toList();
    boxID = (widget.boxID)!;
    boxNo = (widget.boxNo)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Box NO: ${boxNo}"),
        actions: [
          IconButton(
              onPressed: () async {
                List<Lot>? lots = await Lot.getLot();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PickLotInBoxScreen(
                              lotBoxs: lots,
                              boxID: boxID,
                            )));
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                await Box.confirmBox(boxID);
                List<Box>? boxs = await Box.getBox();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddBox(
                              boxs: boxs,
                            )));
              },
              icon: Icon(Icons.check)),
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
    List<BoxDetail>? boxdetailrefersh = await BoxDetail.getBoxDetail(boxID);
    setState(() {
      try {
        boxdetails = boxdetailrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
