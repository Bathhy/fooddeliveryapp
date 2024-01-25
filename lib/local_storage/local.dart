import 'dart:convert';

import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class productStorage {
  static productStorage get instance => productStorage._internal();

  productStorage._internal();
  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  //Cart Local
  //
  // set indi
  Future<bool> setData(Food food) async {
    final allFood = await getFoodRepo();
    final sameorder = allFood.indexWhere((e) => e.name == food.name);
    if (sameorder == -1) {
      allFood.add(food);
      return await putArrays(allFood);
    }
    return false;
  }

  //set all
  Future<Food> getFoodRepos() async {
    final pref = await _getSharePreference();
    final rawString = pref.getString("Cart");
    return Food.fromJson(jsonDecode(rawString ?? ""));
  }

  //Set all
  Future<bool> putArrays(List<Food> foods) async {
    final pref = await _getSharePreference();

    final List<String> tmpList =
        foods.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList("CatList", tmpList);
  }

  // Get all

  Future<List<Food>> getFoodRepo() async {
    final pref = await _getSharePreference();
    List<String> rawlist = pref.getStringList("CatList") ?? [];
    return rawlist.map((e) => Food.fromJson(jsonDecode(e))).toList();
  }

  //Remove all
  Future<bool> removeByKey(String key) async {
    final pref = await _getSharePreference();
    return pref.remove(key);
  }

  //Remove individual
  Future<bool> removeFood(Food foodRepo) async {
    final allFoods = await getFoodRepo();
    allFoods.removeWhere((f) => f.name == foodRepo.name);
    return putArrays(allFoods);
  }

  ///==============
  /// History
  // ============
  //Save 1 1
  Future<void> setDataHistory(HistoryModel foodhistory) async {
    final allFood = await getHistory();
    allFood.add(foodhistory);
    saveHistory(allFood);
  }

  // Save in history
  Future<bool> saveHistory(List<HistoryModel> foodhistory) async {
    final pref = await _getSharePreference();

    final List<String> tmpList =
        foodhistory.map((his) => jsonEncode(his.toMap())).toList();
    return pref.setStringList("HistoryList", tmpList);
  }

  // Get in history
  Future<List<HistoryModel>> getHistory() async {
    final pref = await _getSharePreference();
    List<String> rawList = pref.getStringList("HistoryList") ?? [];
    print(rawList);
    return rawList.map((e) => HistoryModel.fromJson(jsonDecode(e))).toList();
  }

  // ==============
  // Favorite
  // ==============

  // Save 1 1
  Future<bool> setFavlist(Food foodfav) async {
    final favfoood = await getFav();
    final isExting =
        favfoood.indexWhere((element) => element.name == foodfav.name);

    if (isExting == -1) {
      favfoood.add(foodfav);
      return saveDataFav(favfoood);
    }
    return false;
  }

  // Future<bool> setItem(ProductDetile productDetile, String key) async {
  //   final getProductDetile = await getItems(key);
  //   final isExiting = getProductDetile
  //       .indexWhere((element) => element.id == productDetile.id);
  //   if (isExiting == -1) {
  //     getProductDetile.add(productDetile);
  //     return await setItems(getProductDetile, key);
  //   }
  //   return false;
  // }
  // Save in favorite
  Future<bool> saveDataFav(List<Food> favmodel) async {
    final pref = await _getSharePreference();
    final List<String> tmplist =
        favmodel.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList("Favlist", tmplist);
  }

  // Get in favorite
  Future<List<Food>> getFav() async {
    final pref = await _getSharePreference();
    List<String> rawlist = pref.getStringList("Favlist") ?? [];
    return rawlist.map((e) => Food.fromJson(jsonDecode(e))).toList();
  }

// Delete favorite by index
  Future<bool> removefav(Food foodfavdelete) async {
    final allFoods = await getFav();
    allFoods.removeWhere((f) => f.name == foodfavdelete.name);
    return saveDataFav(allFoods);
  }

  // Loign clear
  void clearAcc() async {
    final pref = await _getSharePreference();
    pref.clear();
  }

  // Future<bool> addTofav(Food food) {
  //     final
  // }

  // Future<List<Food>> getFavs() {

  // }

  //  Future<bool> addTofavs(List<Food> listfood) {

  // }

  Future<bool> removeFav(Food food) async {
    final allFoods = await getFav();
    allFoods.removeWhere((f) => f.name == food.name);
    return saveDataFav(allFoods);
  }
}
