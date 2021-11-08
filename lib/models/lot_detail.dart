import 'dart:convert';
import 'package:packing/services/networking.dart';

class LotDetail {
  final int? id;
  final int? formulaID;
  final String? productName;
  final String? productModel;
  final String? formulaCode;
  final double? quantity;
  final String? productLotDetail;
  final String? status;
  final String? dateExt;
  final String? historyStatus;

  LotDetail({
    this.formulaID,
    this.id,
    this.productName,
    this.productModel,
    this.formulaCode,
    this.quantity,
    this.productLotDetail,
    this.status,
    this.dateExt,
    this.historyStatus,
  });

  static Future<List<LotDetail>?> getLotDetail(int lotID) async {
    NetworkHelper networkHelper = NetworkHelper('lot_details', {
      'lot_id': lotID.toString(),
    });

    List<LotDetail> historys = [];
    var json = await networkHelper.getData();
    if (json != null && json['error'] == false) {
      for (Map t in json['lot_details']) {
        LotDetail history = LotDetail(
          id: int.parse(t['id']),
          productName: t['product_name'],
          productModel: t['product_model'],
          dateExt: t['date_ext'],
          historyStatus: t['h_status'],
          formulaID: int.parse(t['f_id']),
        );

        historys.add(history);
      }
      return historys;
    }
    return null;
  }

  // static Future<List<LotDetail>?> getLotDetailID(String username) async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('merge_packs', {'username': username});

  //   List<LotDetail> LotDetails = [];
  //   print(LotDetails);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       LotDetail LotDetail = LotDetail(
  //         id: 1,
  //         mergeNo: t['merge_no'],
  //         productCode: t['part_code'],
  //         mergestatus: t['merge_status'],
  //         labelNO: t['label_no'],
  //       );
  //       LotDetails.add(LotDetail);
  //     }
  //     return LotDetails;
  //   }
  //   return null;
  // }

  // static Future<List<LotDetail>?> upStatusLotDetail(
  //     User user, int LotDetailID, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_merge_packs', {});

  //   List<LotDetail> LotDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'id': LotDetailID.toString(),
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       LotDetail LotDetail = LotDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       LotDetails.add(LotDetail);
  //     }
  //     return LotDetails;
  //   }
  // }

  // static Future<List<LotDetail>?> upStatusMerging(
  //     User user, String mergeNo, String mergestatus) async {
  //   NetworkHelper networkHelper = NetworkHelper('up_status_mergings', {});

  //   List<LotDetail> LotDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'merge_no': mergeNo,
  //     'merge_status': mergestatus,
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       LotDetail LotDetail = LotDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //       );
  //       LotDetails.add(LotDetail);
  //     }
  //     return LotDetails;
  //   }
  // }

  // static Future<LotDetail?> checkLotDetailID(
  //     User user, int productID, int LotDetailID) async {
  //   NetworkHelper networkHelper = NetworkHelper('check_merge_pack_id', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //     'id': LotDetailID.toString(),
  //   }));
  //   print("loginuser");
  //   if (json != null && json['error'] == false) {
  //     Map u = json['merge_packs'];
  //     LotDetail LotDetail = LotDetail(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return LotDetail;
  //   }
  //   return null;
  // }

  // static Future<LotDetail?> addLotDetail(User user, int productID) async {
  //   NetworkHelper networkHelper = NetworkHelper('add_merge_pack', {});
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'product_id': productID.toString(),
  //   }));
  //   if (json != null) {
  //     Map u = json;
  //     LotDetail LotDetail = LotDetail(
  //       id: int.parse(u["id"]),
  //       mergeNo: u['merge_no'],
  //       productID: int.parse(u["product_id"]),
  //       mergestatus: u["merge_status"],
  //     );
  //     return LotDetail;
  //   }
  //   return null;
  // }

  // static Future<List<LotDetail>?> completeLotDetail(
  //     User user, List labels, int LotDetailID) async {
  //   NetworkHelper networkHelper = NetworkHelper('complete_merge_pack', {});
  //   String data = "";
  //   for (String i in labels) {
  //     data += "#" + i;
  //   }

  //   List<LotDetail> LotDetails = [];
  //   var json = await networkHelper.postData(jsonEncode(<String, String>{
  //     'user_id': user.userID.toString(),
  //     'labels': data,
  //     'merge_pack_id': LotDetailID.toString()
  //   }));

  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['merge_packs']) {
  //       LotDetail LotDetail = LotDetail(
  //         id: int.parse(t['id']),
  //         mergeNo: t['merge_no'],
  //         mergestatus: t['merge_status'],
  //         productID: int.parse(t['product_id']),
  //         productCode: t['part_code'],
  //       );
  //       LotDetails.add(LotDetail);
  //     }
  //     return LotDetails;
  //   }
  // }

  //  static Future<List<LotDetail>?> getLotDetailsID() async {
  //   NetworkHelper networkHelper =
  //       NetworkHelper('historys', {});

  //   List<LotDetail> historys = [];
  //   print(historys);
  //   var json = await networkHelper.getData();
  //   if (json != null && json['error'] == false) {
  //     for (Map t in json['historys']) {
  //       LotDetail history = LotDetail(
  //         id: int.parse(t['id']) ,
  //         history_no: t['history_no'],
  //       );
  //       historys.add(history);
  //     }
  //     return historys;
  //   }
  //   return null;
  // }


  static Future<LotDetail?> addLotDetail() async {
    NetworkHelper networkHelper = NetworkHelper('add_lot', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{}));
    if (json != null) {
      for (Map u in json['lots']) {
        LotDetail lot = LotDetail(
          id: int.parse(u['id']),
          // history_no: u['history_no'],
        );
        return lot;
      }
    }
    return null;
  }

  static Future<LotDetail?> addFormulaInLotDetail(int id, int lotID, int historyID) async {
    NetworkHelper networkHelper = NetworkHelper('add_formula_in_lot', {});
    var json = await networkHelper.postData(jsonEncode(<String, String>{
      'formula_id': id.toString(),
      'lot_id': lotID.toString(),
      'id': historyID.toString(),
    }));
    if (json != null) {
      for (Map u in json['lot_details']) {
        LotDetail lot = LotDetail(
          id: int.parse(u['id']),
          // history_no: u['history_no'],
        );
        return lot;
      }
    }
    return null;
  }
}
