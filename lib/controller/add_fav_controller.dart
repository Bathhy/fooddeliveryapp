import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class AddFavouriteController extends GetxController {
  final productStorage _favstorage = productStorage.instance;
  final favouritefood = [].obs;
  RxBool isIconColored = false.obs;
  void getAllFav() async {
    final foodGetaFav = await _favstorage.getFav();
    favouritefood.value = foodGetaFav;
  }

  void saveFavData(Food foods) async {
    await _favstorage.setFavList(foods);
    getAllFav();
    Get.snackbar("Success", "Add to favourite Successfully",
        backgroundColor: colorOrange,
        colorText: colorGrey,
        duration: Duration(seconds: 2));
  }

  void deleteByIndex(Food fooddelete) async {
    final isFavRemove = await _favstorage.remove(fooddelete);
    if (isFavRemove) {
      getAllFav();
    }
    
  }

  // color fav
  void changeColor() {
    isIconColored.value = !isIconColored.value;
  }
}
