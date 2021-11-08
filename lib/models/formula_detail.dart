
import 'package:packing/services/networking.dart';

class ForMula {
  final int? id;
  final String? productName;
  final String? formulaCode;
  final String? productModel;
  final String? componet;
  final int? ext;
  final double? quantity;
  final String? indication;
  final String? maufacturer;
  final String? license;
  final String? detail;

  ForMula({
    this.id,
    this.productName,
    this.formulaCode,
    this.componet,
    this.ext,
    this.quantity,
    this.indication,
    this.maufacturer,
    this.productModel,
    this.detail,
    this.license,

  });

  static Future<List<ForMula>?> getForMula() async {
    NetworkHelper networkHelper = NetworkHelper('formula_details', {});
    List<ForMula> formuladetailss = [];
    var json = await networkHelper.getData();

    for (Map t in json['formula_details']) {
      ForMula formuladetails = ForMula(
        id: int.parse(t['id']),
        productName: t['product_name'],
        productModel: t['product_model'],
        ext: int.parse(t['ext']),
        componet: t['componet'],
        indication: t['indication'],
        maufacturer: t['maufacturer'],
        detail: t['detail'],
        license: t['license'],
        quantity: double.parse(t['quantity']),
        formulaCode: t['formulas_code'],
      );
      formuladetailss.add(formuladetails);
    }
    return formuladetailss;
  }

  static Future<List<ForMula>?> getForMula1(int id) async {
    NetworkHelper networkHelper = NetworkHelper('formula_details', {
      'id': id.toString(),
    });
    List<ForMula> formuladetailss = [];
    var json = await networkHelper.getData();

    for (Map t in json['formula_details']) {
      ForMula formuladetails = ForMula(
        id: int.parse(t['id']),
        productName: t['product_name'],
        productModel: t['product_model'],
        ext: int.parse(t['ext']),
        componet: t['componet'],
        indication: t['indication'],
        maufacturer: t['maufacturer'],
        detail: t['detail'],
        license: t['license'],
        quantity: double.parse(t['quantity']),
        formulaCode: t['formulas_code'],
      );
      formuladetailss.add(formuladetails);
    }
    return formuladetailss;
  }
}