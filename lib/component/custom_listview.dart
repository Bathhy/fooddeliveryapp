import 'package:fodddelieveryapp/image/image_declare.dart';

class Food {
  String img = "";
  String name = "";
  String price = "";
  String? category;
  List<String> imagecate = [];

  Food({
    required String img,
    required String name,
    required String price,
    String? category,
    List<String>? imagecate,
  }) {
    this.img = img;
    this.name = name;
    this.price = price;
    this.category = category;
    this.imagecate = imagecate ?? [];
  }

  static List<Food> foodlist = [
    Food(
      img: imageDumpling,
      name: "Hot Dumpling",
      price: "\$19",
      category: "Food",
      imagecate: [imageDumpling, imageSpag, imagepPizza, imagepancake],
    ),
    Food(
        img: imageSpag,
        name: "Spaghetti",
        price: "\$23",
        category: "Food",
        imagecate: [imageSpag, imageDumpling, imagepPizza, imagepancake]),
    Food(
        img: imagepPizza,
        name: "Ham Pizza",
        price: "\$15",
        category: "Food",
        imagecate: [imagepPizza, imageSpag, imageDumpling, imagepancake]),
    Food(
        img: imagepancake,
        name: "Japanese Pancake",
        price: "\$9",
        category: "Food",
        imagecate: [imagepancake, imageDumpling, imageSpag, imagepPizza]),
    Food(
        img: imageblue,
        name: "Blue Lagoon",
        price: "\$9",
        category: "Drink",
        imagecate: [imageblue, imageblue]),
    Food(
        img: imageblue,
        name: "Kampuchea frappe",
        price: "\$9",
        category: "Drink",
        imagecate: [imageblue, imageblue]),
    Food(
        img: imageblue,
        name: "Fire mocktail",
        price: "\$9",
        category: "Drink",
        imagecate: [imageblue, imageblue]),
    Food(
        img: imagelays,
        name: "Spicy cheetos",
        price: "\$6",
        category: "Snacks",
        imagecate: [imagelays, imagelays]),
    Food(
        img: imagelays,
        name: "Juicy cheetos",
        price: "\$6",
        category: "Snacks",
        imagecate: [imagelays, imagelays]),
    Food(
        img: imagespicy,
        name: "Cheese sauce",
        price: "\$2",
        category: "Sauces",
        imagecate: [imagespicy, imagespicy]),
    Food(
        img: imagespicy,
        name: "Cheese sauce",
        price: "\$2",
        category: "Sauces",
        imagecate: [imagespicy, imagespicy]),
  ];
}
