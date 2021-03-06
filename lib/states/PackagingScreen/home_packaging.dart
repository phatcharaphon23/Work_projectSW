import 'package:flutter/material.dart';
import 'package:packing/models/box.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/models/lot_detail.dart';
import 'package:packing/states/PackagingScreen/formula_in_lot.dart';
import 'package:packing/states/PackagingScreen/box_screen.dart';
import 'package:packing/states/PackagingScreen/pick_formula_in_lot.dart';
import 'package:packing/states/packaging_screengg.dart';
import 'package:packing/utility/my_constant.dart';

class LotPage extends StatefulWidget {
  final List<Lot>? lots;
  LotPage({
    this.lots,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<LotPage> {
  List<Lot> lots = [];
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var lot in lots) {
      if (lot.status == "CREATED") {
        var l = ListTile(
          title: Text(lot.productLot!),
          subtitle: Text(lot.status!),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Details'),
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      width: 400.0,
                      height: 100.0,
                      child: Column(
                        children: [Text("ยืนยัน lot")],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Add'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await Lot.confirmLot(lot.id!);
                          refreshSceen();
                        },
                      ),
                      TextButton(
                          child: Text('Close'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.save)),
          onTap: () async {
            List<LotDetail>? lotDetails = await LotDetail.getLotDetail(lot.id!);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormulaInLotScreen(
                          lotID: lot.id!,
                          lotNo: lot.productLot!,
                          lotDetails: lotDetails,
                        )));
          },
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
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    lots = (widget.lots ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Lot ยา"),
        actions: [
          IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Details'),
                    backgroundColor: Colors.white,
                    content: SizedBox(
                      width: 400.0,
                      height: 100.0,
                      child: Column(
                        children: [Text("สร้างกล่อง")],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                          child: Text('Add'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () async {
                            await Lot.addLot();
                            Navigator.pop(context);
                          }),
                      TextButton(
                          child: Text('Cancel'),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.add)),
              IconButton(onPressed: () async{
                List <Box>? boxs = await Box.getBox();
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddBox(
                  boxs: boxs,
                )));
              }, icon: Icon(Icons.outbox))
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
    List<Lot>? lotrefersh = await Lot.getLot();
    setState(() {
      try {
        lots = lotrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
