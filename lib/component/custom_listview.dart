import 'package:fodddelieveryapp/image/image_declare.dart';

class Food {
  String img = "";
  String name = "";
  String price = "";
  String? category;
  List<String> imagecate = [];
  int qty = 1;

  Food({
    required String img,
    required String name,
    required String price,
    String? category,
    List<String>? imagecate,
    int qty = 1,
  }) {
    this.img = img;
    this.name = name;
    this.price = price;
    this.category = category;
    this.imagecate = imagecate ?? [];
    this.qty = qty;
  }

  Map<String, dynamic> toMap() {
    return {
      'img': this.img,
      'name': this.name,
      'price': this.price,
      'category': this.category,
      'imagecate': this.imagecate,
    };
  }

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      img: json['img'] ?? "", // Add 'img' field here
      name: json['name'] ?? "",
      price: json['price'] ?? "",
      category: json['category'],
      imagecate: List<String>.from(json['imagecate'] ?? []),
    );
  }

  static Food fromJsonMap(Map<String, dynamic> map) {
    return Food.fromJson(map);
  }

  static List<Food> foodlist = [
    Food(
      img: imageDumpling,
      name: "Hot Dumpling",
      price: "19",
      category: "Food",
      imagecate: [imageDumpling, imageSpag, imagepPizza, imagepancake],
    ),
    Food(
        img: imageSpag,
        name: "Spaghetti",
        price: "23",
        category: "Food",
        imagecate: [imageSpag, imageDumpling, imagepPizza, imagepancake]),
    Food(
        img: imagepPizza,
        name: "Ham Pizza",
        price: "15",
        category: "Food",
        imagecate: [imagepPizza, imageSpag, imageDumpling, imagepancake]),
    Food(
        img: imagepancake,
        name: "Japanese Pancake",
        price: "9",
        category: "Food",
        imagecate: [imagepancake, imageDumpling, imageSpag, imagepPizza]),
    Food(
        img: imageblue,
        name: "Blue Lagoon",
        price: "9",
        category: "Drink",
        imagecate: [imageblue, imageFrape, imageSOB, imageMS]),
    Food(
        img: imageFrape,
        name: "Kampuchea frappe",
        price: "9",
        category: "Drink",
        imagecate: [imageFrape, imageblue, imageSOB, imageMS]),
    Food(
        img: imageSOB,
        name: "Fire mocktail",
        price: "9",
        category: "Drink",
        imagecate: [imageSOB, imageblue, imageFrape, imageMS]),
    Food(
        img: imageMS,
        name: "Chocolate Frappe",
        price: "9",
        category: "Drink",
        imagecate: [
          imageMS,
          imageblue,
          imageFrape,
          imageSOB,
        ]),
    Food(
        img: imagelays,
        name: "Spicy cheetos",
        price: "6",
        category: "Snacks",
        imagecate: [imagelays, imagesour]),
    Food(
        img: imagesour,
        name: "Juicy cheetos",
        price: "6",
        category: "Snacks",
        imagecate: [imagesour, imagelays]),
    Food(
        img: imagespicy,
        name: "Cheese sauce",
        price: "2",
        category: "Sauces",
        imagecate: [imagespicy, imagecheese]),
    Food(
        img: imagecheese,
        name: "Cheese sauce",
        price: "2",
        category: "Sauces",
        imagecate: [
          imagecheese,
          imagespicy,
        ]),
  ];
}
