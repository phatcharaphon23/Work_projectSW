import 'package:flutter/material.dart';
import 'package:packing/models/formula_detail.dart';
import 'package:packing/states/information_screen.dart';
// import 'package:packing/models/formula_detail.dart';
// import 'package:packing/states/PackagingScreen/formula_in_formula.dart';
// import 'package:packing/states/PackagingScreen/pick_formula_in_formula.dart';
import 'package:packing/utility/my_constant.dart';

class ForMulaScreen extends StatefulWidget {
  final List<ForMula>? formulas;
  ForMulaScreen({
    this.formulas,
  });

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<ForMulaScreen> {
  List<ForMula> formulas = [];
  List<ListTile> getListTile() {
    List<ListTile> list = [];
    for (var formula in formulas) {
      var l = ListTile(
        title: Text(formula.productName!),
        subtitle: Text(formula.productModel!),
        trailing: Text(formula.quantity.toString()),
        onTap: () async {
          List <ForMula>? formulardetails = await ForMula.getForMula1(formula.id!);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InformationScreen(
                formulardetails:formulardetails, 
              )));
          // List<ForMula>? formuladetails = await ForMula.getForMula1(formula.id!);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HistoryForMulaDetailScreen(
          //               formuladetails: formuladetails,
          //               formulaID: formula.id,
          //               formulaNo: formula.formulaNo,
          //             )));
        },
      );
      list.add(l);
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    formulas = (widget.formulas ?? []).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Myconstant.dark,
        title: Text("ตำหรับยา"),
      ),
      body: Container(
        child: ListView(
          children: getListTile(),
        ),
      ),
    );
  }

  Future refreshSceen() async {
    List<ForMula>? formularefersh = await ForMula.getForMula();
    setState(() {
      try {
        formulas = formularefersh ?? [];
      } catch (e) {
        print(e);
      }
    });
  }
}
