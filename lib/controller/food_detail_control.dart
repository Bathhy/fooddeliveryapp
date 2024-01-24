
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
// import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
// import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxList<Food> foodcart = <Food>[].obs;
  // final productStorage _favstorage = productStorage.instance;

  List<Food> selectedFoods = [];
  List<Food> favoriteFoods = [];

  // RxBool isIconColored = false.obs;
  var cartCount = 0.obs;
  var totalprice = 0.obs;
  RxString totalAmount = ''.obs;

  productStorage _productStorage = productStorage.instance;

  final productStorage _storage = productStorage.instance;
  bool favStatus = false;
  final foodList = <Food>[].obs;
  final totalqty = 0.obs;

  // void addTocart(Food foodrepo) async {
  //   await _productStorage.setData(foodrepo);

  //   Get.find<AddtoCartController>().totalQTY();
  //   Get.snackbar("Success", "Add to favourite Successfully",
  //       backgroundColor: colorOrange,
  //       colorText: colorGrey,
  //       duration: Duration(seconds: 2));
  //   update();
  // }

// cart controller
  // void removeFromCart(Food food) {
  //   foodcart.remove(food);
  //   cartCount--;
  //   calculateAmount(food);
  //   calculateAmount(food);
  //   update();
  // }

  // void addToCart(Food food) {
  //   foodcart.add(food);
  //   cartCount++;
  //   Get.snackbar("Success", "Add to Cart Successfully",
  //       backgroundColor: colorOrange,
  //       colorText: colorGrey,
  //       duration: Duration(seconds: 3));
  //   calculateAmount(food);
  //   update();
  // }

  // void CartEmpty(Food food) {
  //   foodcart.clear();
  //   update();
  // }

  // void checkcartEmpty() {
  //   if (foodcart.isEmpty) {
  //     Get.snackbar("No Items", "Please Add food to Cart",
  //         backgroundColor: Colors.red[900],
  //         colorText: colorGrey,
  //         snackPosition: SnackPosition.TOP,
  //         duration: Duration(seconds: 3));
  //   } else {
  //     Get.to(() => Mypaymentpage());
  //   }
  // }

  void calculateAmount(Food food) {
    int total = 0;

    for (var food in foodcart) {
      int price = int.tryParse(food.price.replaceAll('\$', '')) ?? 0;
      total += price;
    }

    totalprice.value = total;
    totalAmount.value = '\$$total';
  }
  //   void getFavs(Food foodRepo) async {
  //   final favs = await _productStorage.getFav();

  //   final favFood = favs
  //       .firstWhereOrNull((element) => element.name == foodRepo.name);
  //   favStatus = favFood != null;
  //   update();
  // }

  // void saveFavData(Food foods) async {
  //   final favs = await _productStorage.getFav();
  //   final isExist =
  //       favs.indexWhere((element) => element.name == foods.name) != -1;

  //    if (isExist) {
  //     await _productStorage.removeFav(foods);
  //   } else {
  //     await _productStorage.setFavList(foods);
  //   }
  //   getFavs(foods);
  //   Get.find<AddToFavoriteController>().getAllFav();
  // }

//fav controller

  // void addToFav(Food food) {
  //   if (!favoriteFoods.contains(food)) {
  //     favoriteFoods.add(food);

  //     update();
  // Get.snackbar("Success", "Add to favourite Successfully",
  //     backgroundColor: colorOrange,
  //     colorText: colorGrey,
  //     duration: Duration(seconds: 3));
  //   }
  //   changeColor();
  // }

  // void removeFromFav(Food food) {
  //   favoriteFoods.remove(food);
  //   update();
  // }

  // void favEmpty(Food food) {
  //   favoriteFoods.clear();
  //   update();
  // }
  // void getAllFav() async {
  //   final foodGetaFav = await _favstorage.getFav();
  //   foodcart.value = foodGetaFav;
  // }

  // void saveFavData(Food foods) async {
  //   await _favstorage.setFavList(foods);
  //   getAllFav();
  // }

  // void deleteByIndex(Food fooddelete) async {
  //   final isFavRemove = await _favstorage.remove(fooddelete);
  //   if (isFavRemove) {
  //     getAllFav();
  //   }
  // }

  // // color fav
  // void changeColor() {
  //   isIconColored.value = !isIconColored.value;
  // }

// history controller
  void completeOrder() {
    String orderDate = DateTime.now().toString();
    int qty = foodcart.length;
    double totalAmount = 0.0;

    foodcart.forEach((element) {
      totalAmount += double.parse(element.price);
    });

    HistoryModel historyModel = HistoryModel(
        orderDate: orderDate,
        totalAmount: totalAmount,
        qty: qty,
        items: List.from(foodcart));

    Get.find<HistoryController>().addToHistory(historyModel);

    Get.offAll(() => MyBottomNavigation());
    clearcart();
  }

  void clearcart() {
    foodcart.clear();
    cartCount.value = 0;
    // totalprice.value = 0;
    // totalAmount.value = '';
    update();
  }
}
