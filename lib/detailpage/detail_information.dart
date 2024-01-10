import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';

class DetailfoodInfo extends StatefulWidget {
  const DetailfoodInfo({Key? key, required this.food});

  final Food food;

  @override
  State<DetailfoodInfo> createState() => _DetailfoodInfoState();
}

class _DetailfoodInfoState extends State<DetailfoodInfo> {
  DetailController _controler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          DescriptionDetailpage(
            food: widget.food,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              title: 'Add to cart',
              callback: () {
                _controler.addToCart(widget.food);
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: colorGrey,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,
      ),
      actions: [
        IconButton(
            onPressed: () {
              _controler.addToFav(widget.food);
            },
            icon: Icon(Icons.favorite_outline))
      ],
    );
  }
}

class DescriptionDetailpage extends StatefulWidget {
  const DescriptionDetailpage({Key? key, required this.food});
  final Food food;

  @override
  State<DescriptionDetailpage> createState() => _DescriptionDetailpageState();
}

class _DescriptionDetailpageState extends State<DescriptionDetailpage> {
  int _activepage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (int page) {
                  setState(() {
                    _activepage = page;
                  });
                },
                itemCount: widget.food.imagecate.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: colorOrange,
                        child: Image.asset(
                          widget.food.imagecate[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 10,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        widget.food.imagecate.length,
                        (index) {
                          return Container(
                            padding: EdgeInsets.only(right: 6),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: _activepage == index
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ))
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            widget.food.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Text(
            widget.food.price,
            style: TextStyle(
              color: colorOrange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Delivery Info",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Return Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                  maxLines: 4,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
