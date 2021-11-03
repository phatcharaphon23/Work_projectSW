
import 'package:packing/services/networking.dart';

class FormulaDetail {
  final int? id;
  final String? formulaCode;

  FormulaDetail({
    this.id,
    this.formulaCode,
  });

  static Future<List<FormulaDetail>?> getFormulaDetail() async {
    NetworkHelper networkHelper = NetworkHelper('formula_details', {});
    List<FormulaDetail> formuladetailss = [];
    var json = await networkHelper.getData();

    for (Map t in json['formula_details']) {
      FormulaDetail formuladetails = FormulaDetail(
        id: int.parse(t['id']),
        formulaCode: t['formulas_code'],
      );
      formuladetailss.add(formuladetails);
    }
    return formuladetailss;
  }
}