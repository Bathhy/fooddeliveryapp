import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class AddtoCartController extends GetxController {
  RxList<Food> foodcart = <Food>[].obs;
  // final productStorage _favstorage = productStorage.instance;

  List<Food> selectedFoods = [];
  List<Food> favoriteFoods = [];
  final foodList = <Food>[].obs;
  final totalqty = 0.obs;

  productStorage _productStorage = productStorage.instance;

  final productStorage _storage = productStorage.instance;
  void addTocart(Food foodrepo) async {
    final isSave = await _productStorage.setData(foodrepo);

    if (isSave) {
      Get.find<AddtoCartController>().totalQTY();
      Get.snackbar("Success", "Add to favourite Successfully",
          backgroundColor: colorOrange,
          colorText: colorGrey,
          duration: Duration(seconds: 2));
    }
  }

  void getAllFood() async {
    final foods = await _storage.getFoodRepo();
    foodList(foods);
    update();
  }

  void remvoeAll() {
    _storage.removeByKey("CatList");
    foodList.clear();
    totalQTY();
  }

  void removeOne(Food foodRepo) async {
    final isRemvoe = await _storage.removeFood(foodRepo);
    if (isRemvoe) {
      getAllFood();
      totalQTY();
    }
  }

  void totalQTY() async {
    final allItems = await _storage.getFoodRepo();
    print("===== ${allItems.length}");
    totalqty.value = allItems.length;
  }

  void increateQty(int index) {
    foodList[index].qty += 1;
    update();
  }

  void decreateQty(int index) {
    if (foodList[index].qty <= 0) {
      return;
    }

    foodList[index].qty -= 1;
    update();
  }
}
