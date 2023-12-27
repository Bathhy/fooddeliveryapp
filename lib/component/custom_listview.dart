import 'package:fodddelieveryapp/image/image_declare.dart';

class Food {
  String img = "";
  String name = "";
  String price = "";

  Food({required String img, required String name, required String price}) {
    this.img = img;
    this.name = name;
    this.price = price;
  }
}

List<Food> foodlist = [
  Food(img: imageDumpling, name: "Hot Dumpling", price: "N1,900"),
  Food(img: imageSpag, name: "Spaghetti", price: "N2,300"),
  Food(img: imagepPizza, name: "Ham Pizza", price: "N30,00"),
  Food(img: imagepancake, name: "Japanese Pancake", price: "N5,000"),
];
