import 'package:flutter/material.dart';
import 'package:packing/models/historys.dart';
import 'package:packing/models/lot.dart';
import 'package:packing/utility/my_constant.dart';

class PickForMulaInLotScreen extends StatefulWidget {
  final int? lotID;
  final String? lotNo;
  final List<History>? history;
  PickForMulaInLotScreen({
    this.lotID,
    this.lotNo,
    this.history,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<PickForMulaInLotScreen> {
  List<History> history = [];
  int lotID = 0;
  String lotNo = "";

  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var history in history) {
      if (history.status == "SCAN") {
        var l = ListTile(
          title: Text(history.productName!),
          subtitle: Text(history.productModel!),
          // trailing: IconButton(onPressed: () {}, icon: Icon(Icons.check)),
          trailing: TextButton(
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
                        children: [Text("do you want add formula in lot??")],
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
                          Navigator.pop(context);
                          await Lot.addFormulaInLot(
                              history.formulaID!, lotID, history.id!);
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
              child: Icon(Icons.add)),
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
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    history = (widget.history ?? []).toList();
    lotID = (widget.lotID)!;
    lotNo = (widget.lotNo)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Lot ${lotNo}"),
        actions: [
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
    List<History>? historyrefersh = await History.getHistory();
    setState(() {
      try {
        history = historyrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
