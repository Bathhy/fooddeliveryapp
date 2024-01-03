import 'package:fodddelieveryapp/image/image_declare.dart';

class Food {
  String img = "";
  String name = "";
  String price = "";
  String? category;
  String? purchasecate;

  Food(
      {required String img,
      required String name,
      required String price,
      String? category,
      String? purchasecate}) {
    this.img = img;
    this.name = name;
    this.price = price;
    this.category = category;
    this.purchasecate = purchasecate;
  }

  static List<Food> foodlist = [
    Food(
        img: imageDumpling,
        name: "Hot Dumpling",
        price: "\$19",
        category: "Food"),
    Food(img: imageSpag, name: "Spaghetti", price: "\$23", category: "Food"),
    Food(img: imagepPizza, name: "Ham Pizza", price: "\$15", category: "Food"),
    Food(
        img: imagepancake,
        name: "Japanese Pancake",
        price: "\$9",
        category: "Food"),
    Food(img: imageblue, name: "Blue Lagoon", price: "\$9", category: "Drink"),
    Food(
        img: imageblue,
        name: "Kampuchea frappe",
        price: "\$9",
        category: "Drink"),
    Food(
        img: imageblue, name: "Fire mocktail", price: "\$9", category: "Drink"),
    Food(
        img: imagelays,
        name: "Spicy cheetos",
        price: "\$6",
        category: "Snacks"),
    Food(
        img: imagelays,
        name: "Juicy cheetos",
        price: "\$6",
        category: "Snacks"),
    Food(
        img: imagespicy,
        name: "Cheese sauce",
        price: "\$2",
        category: "Sauces"),
    Food(
        img: imagespicy,
        name: "Cheese sauce",
        price: "\$2",
        category: "Sauces"),
  ];
}
