import 'm_db.dart';
import '../../network/net_models.dart';
import 'dart:async';

class MoorRepo {
  late MoorDb _moorDb;

  Future<void> init() async {
    _moorDb = MoorDb();
  }

  void close() {
    _moorDb.close();
  }

  // --- user profile
  Future<List<String>> getUserProfile() async {
    int countUser = await _moorDb.userSelectCount().getSingle();

    final List<String> result = ['','',''];
    if (countUser != 0) {
      final uList = await _moorDb.userSelect().getSingle();
      result[0] = uList.name;
      result[1] = uList.phone!;
      result[2] = uList.email!;
    }

    return Future.value(result);
  }

  Future<void> updateUserProfile(String name, String phone, String email)
  async {
    int countUser = await _moorDb.userSelectCount().getSingle();
    if (countUser == 0) {
      await _moorDb.userInsert(name, phone, email);
    } else {
      await _moorDb.userUpdate(name, phone, email);
    }
  }

  // --- preload data
  Future<void> insertCoffee(APICoffee c) async {
    await _moorDb.insertCoffee(convertAPICoffeeToCoffeeCompanion(c));
  }

  Future<void> insertCategory(APICategory c) async {
    await _moorDb.insertCategory(convertAPICategoryToCategoryCompanion(c));
  }

  Future<List<APICategory>> getAllCategory() async {
    final coffeeData = await _moorDb.getAllCategory().get();
    final List<APICategory> cList = [];
    coffeeData.forEach((element) {
      cList.add(convertCategoryDataToAPICategory(element));
    });
    return cList;
  }

  Future<List<APICoffee>> getDiscounts() async {
    final coffeeData = await _moorDb.getDiscountsList().get();
    final List<APICoffee> coffeeList = [];
    coffeeData.forEach((element) {
      coffeeList.add(convertCoffeeDataToAPICoffee(element));
    });
    return coffeeList;
  }

  Future<List<APICoffee>> getPopular() async {
    final coffeeData = await _moorDb.getPopularList().get();
    final List<APICoffee> coffeeList = [];
    coffeeData.forEach((element) {
      coffeeList.add(convertCoffeeDataToAPICoffee(element));
    });
    return coffeeList;
  }

  Future<List<APICoffee>> getByCategory(int catID) async {
    final coffeeData = await _moorDb.getByCategory(catID).get();
    final List<APICoffee> coffeeList = [];
    coffeeData.forEach((element) {
      coffeeList.add(convertCoffeeDataToAPICoffee(element));
    });
    return coffeeList;
  }


  // --- favorite
  Stream<bool> watchIsFavorite(int id) {
    return _moorDb.isFavorite(id)
        .watch()
        .map((event) {
          if (event.first == 0) {
            return false;
          } else {
            return true;
          }
        });
  }

  Stream<List<APICoffee>> watchAllFavorites() {
    return _moorDb.getAllFavoriteList()
        .watch()
        .map((rows) {
          List<APICoffee> _result = [];
          rows.forEach((element) {
            _result.add(convertCoffeeDataToAPICoffee(element));
          });
          return _result;
    });
  }

  Future<void> addFavorite(int id) async {
    await _moorDb.addFavorite(id);
  }

  Future<void> remFavorite(int id) async {
    await _moorDb.remFavorite(id);
  }

}
