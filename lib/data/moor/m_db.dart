import 'package:moor_flutter/moor_flutter.dart';
import '../../network/net_models.dart';
import 'dart:async';

part 'm_db.g.dart';

@UseMoor(
  include: {'m_db.moor'}
)
class MoorDb extends _$MoorDb {
  MoorDb() : super(FlutterQueryExecutor.inDatabaseFolder(
      path: 'app.sqlite',
      logStatements: false
  ));

  @override
  int get schemaVersion => 1;

  Future<void> insertCoffee(CoffeeCompanion companion) async {
    await into(coffee).insert(companion, mode: InsertMode.insertOrIgnore);
  }

  Future<void> insertCategory(CategoryCompanion companion) async {
    await into(category).insert(companion, mode: InsertMode.insertOrIgnore);
  }

}

CoffeeCompanion convertAPICoffeeToCoffeeCompanion(APICoffee c) {
  return CoffeeCompanion.insert(
      id: Value(c.id),
      cat: Value(c.cat),
      brand: Value(c.brand),
      label: Value(c.label),
      price: Value(c.price),
      discount: Value(c.discount),
      weight: Value(c.weight),
      img: Value(c.img),
      tt: Value(c.tt),
      drink: Value(c.drink),
      roast: Value(c.roast),
      pack: Value(c.pack),
      compound: Value(c.compound),
      intensity: Value(c.intensity),
      origin: Value(c.origin),
      life: Value(c.life),
      description: Value(c.description)
  );
}

APICoffee convertCoffeeDataToAPICoffee(CoffeeData c) {
  return APICoffee(
      id: c.id,
      cat: c.cat!,
      brand: c.brand!,
      label: c.label!,
      price: c.price!,
      discount: c.discount!,
      weight: c.weight!,
      img: c.img!,
      tt: c.tt!,
      drink: c.drink!,
      roast: c.roast!,
      pack: c.pack!,
      compound: c.compound!,
      intensity: c.intensity!,
      origin: c.origin!,
      life: c.life!,
      description: c.description!
  );
}

CategoryCompanion convertAPICategoryToCategoryCompanion(APICategory c) {
  return CategoryCompanion.insert(
    id: Value(c.id),
    name: Value(c.name),
    img: Value(c.img)
  );
}

APICategory convertCategoryDataToAPICategory(CategoryData c) {
  return APICategory(
      id: c.id,
      name: c.name!,
      img: c.img!
  );
}