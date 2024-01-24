import 'dart:convert';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:intl/intl.dart';

class HistoryModel {
  final String orderDate;
  final double totalAmount;
  final int qty;
  final List<Food> items;

  HistoryModel(
      {required this.orderDate,
      required this.qty,
      required this.totalAmount,
      required this.items});

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    List<Food> detailHistory = [];
    if (json['items'] != null) {
      detailHistory = (json['items'] as List)
          .map((e) => Food.fromJson(jsonDecode(jsonEncode(e))))
          .toList();
    }
    return HistoryModel(
        orderDate: json["orderDate"],
        totalAmount: json['totalAmount'],
        qty: json['qty'],
        items: detailHistory);
  }

  Map<String, dynamic> toMap() {
    return {
      "orderDate": orderDate,
      "qty": qty,
      "totalAmount": totalAmount,
      "items": items.map((e) => jsonEncode(e.toMap())).toList()
    };
  }

  String Dateformat() =>
      DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(orderDate));
}
