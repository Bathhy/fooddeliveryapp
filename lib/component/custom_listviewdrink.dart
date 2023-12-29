import 'package:fodddelieveryapp/image/image_declare.dart';

class Drink {
  String img = "";
  String name = "";
  String price = "";

  Drink({required String img, required String name, required String price}) {
    this.img = img;
    this.name = name;
    this.price = price;
  }
}
List<Drink>drinklist = [
  Drink(img: imageblue, name:"Blue lagoon Drink", price:"\$5"),
  Drink(img: imageblue, name:"Blue lagoon Drink", price:"\$5"),
  Drink(img: imageblue, name:"Blue lagoon Drink", price:"\$5"),
  Drink(img: imageblue, name:"Blue lagoon Drink", price:"\$5"),
];