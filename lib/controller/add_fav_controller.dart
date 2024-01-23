import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class AddFavouriteController extends GetxController {
  final productStorage _favstorage = productStorage.instance;
  final favouritefood = <Food>[].obs;
  RxBool isIconColored = false.obs;
  void getAllFav() async {
    final foodGetaFav = await _favstorage.getFav();
    favouritefood.value = foodGetaFav;
  }

  void saveFavData(Food foods) async {
    await _favstorage.setFavlist(foods);
    getAllFav();
    Get.snackbar("Success", "Add to favourite Successfully",
        backgroundColor: colorOrange,
        colorText: colorGrey,
        duration: Duration(seconds: 2));
    update();
  }

  void deledtedfav() {
    _favstorage.removeByKey("Favlist");
    favouritefood.clear();
  }

  void deleteByIndex(Food fooddelete) async {
    final isFavRemove = await _favstorage.removefav(fooddelete);
    if (isFavRemove) {
      favouritefood.remove(fooddelete);
      update();
    }
  }

  // color fav
  void changeColor() {
    isIconColored.value = !isIconColored.value;
  }

  void increateQty(int index) {
    favouritefood[index].qty += 1;
    update();
  }

  void decreateQty(int index) {
    if (favouritefood[index].qty < 0) {
      return;
    }

    favouritefood[index].qty -= 1;
    update();
  }
}
