import 'package:flutter/material.dart';
import 'package:packing/models/box_detail.dart';
import 'package:packing/models/box.dart';
import 'package:packing/states/PackagingScreen/box_detail_screen.dart';
// import 'package:packing/models/box_detail.dart';
// import 'package:packing/states/PackagingScreen/formula_in_box.dart';
// import 'package:packing/states/PackagingScreen/pick_formula_in_box.dart';
import 'package:packing/utility/my_constant.dart';

class AddBox extends StatefulWidget {
  final List<Box>? boxs;
  AddBox({
    this.boxs,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<AddBox> {
  List<Box> boxs = [];
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var box in boxs) {
      if (box.status == "CREATED") {
        var l = ListTile(
          title: Text(box.boxNo!),
          subtitle: Text(box.status!),
          trailing:  Text(box.quantity.toString()),
          onTap: () async {
            List<BoxDetail>? boxdetails = await BoxDetail.getBoxDetail(box.id!);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BoxDetailScreen(
                          boxdetails: boxdetails,
                          boxID: box.id,
                          boxNo: box.boxNo,
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
    boxs = (widget.boxs ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("Box ยา"),
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
                        children: [Text("สร้างกล่องยา")],
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
                            await Box.addBox();
                            refreshSceen();
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
    List<Box>? boxrefersh = await Box.getBox();
    setState(() {
      try {
        boxs = boxrefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
