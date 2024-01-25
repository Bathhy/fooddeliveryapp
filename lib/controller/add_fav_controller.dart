import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class AddFavouriteController extends GetxController {
  final productStorage _favstorage = productStorage.instance;
  final favouritefood = <Food>[].obs;
  var favStatus = false;

  void initIcons(Food foods) async {
    final foodGetaFav = await _favstorage.getFav();
    final index =
        foodGetaFav.indexWhere((element) => element.name == foods.name) != -1;

    favStatus = index;
    update();
  }

  void getAllFav() async {
    final foodGetaFav = await _favstorage.getFav();
    favouritefood.value = foodGetaFav;
  }

  void getFavs(Food foodRepo) async {
    final favs = await _favstorage.getFav();

    final favFood =
        favs.firstWhereOrNull((element) => element.name == foodRepo.name);
    update();
  }

  void saveFavData(Food foods) async {
    final getFav = await _favstorage.getFav();

    final isExiting =
        getFav.indexWhere((element) => element.name == foods.name);

    if (isExiting != -1) {
      deleteByIndex(foods);
      print("----->> Delete Fav <<-----");

      favStatus = false;
      update();

      getAllFav();
      Get.snackbar("Delete", "Delete favourite Successfully",
          backgroundColor: Colors.red[700],
          colorText: colorGrey,
          duration: Duration(seconds: 1));
    } else {
      final isSave = await _favstorage.setFavlist(foods);
      if (isSave) {
        favStatus = isSave;
        update();
        print('--->> Save Fav <<-----');

        getAllFav();
        Get.snackbar("Success", "Add to favourite Successfully",
            backgroundColor: colorOrange,
            colorText: colorGrey,
            duration: Duration(seconds: 1));
      }
    }
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
}
