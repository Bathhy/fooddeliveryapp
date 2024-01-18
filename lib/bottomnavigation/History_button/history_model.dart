import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:intl/intl.dart';

class HistoryModel {
  String orderDate;
  double totalAmount;
  int qty;
  List<Food> items;

  HistoryModel(this.orderDate, this.totalAmount, this.qty, this.items);
  

  String Dateformat()=> DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.parse(orderDate));
}
