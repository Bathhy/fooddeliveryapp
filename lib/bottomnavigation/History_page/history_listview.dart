import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';

class HistoryOrderView extends StatelessWidget {
  final HistoryModel historyModel;
  const HistoryOrderView({
    required this.historyModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyModel.items.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        historyModel.items[index].img,
                        height: 80,
                        width: 80,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      historyModel.items[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          ' \$ ${historyModel.items[index].price}',
                          style: TextStyle(
                              color: colorOrange,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ' Items: ${historyModel.items[index].qty}',
                          style: TextStyle(
                              color: colorOrange,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
        );
      },
    );
  }
}
