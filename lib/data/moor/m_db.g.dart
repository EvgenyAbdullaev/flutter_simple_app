// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String? name;
  final String? img;
  CategoryData({required this.id, this.name, this.img});
  factory CategoryData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CategoryData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      img: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || img != null) {
      map['img'] = Variable<String?>(img);
    }
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      img: img == null && nullToAbsent ? const Value.absent() : Value(img),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      img: serializer.fromJson<String?>(json['img']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'img': serializer.toJson<String?>(img),
    };
  }

  CategoryData copyWith({int? id, String? name, String? img}) => CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('img: $img')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, img.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.name == this.name &&
          other.img == this.img);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> img;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.img = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.img = const Value.absent(),
  });
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String?>? name,
    Expression<String?>? img,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (img != null) 'img': img,
    });
  }

  CategoryCompanion copyWith(
      {Value<int>? id, Value<String?>? name, Value<String?>? img}) {
    return CategoryCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (img.present) {
      map['img'] = Variable<String?>(img.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('img: $img')
          ..write(')'))
        .toString();
  }
}

class Category extends Table with TableInfo<Category, CategoryData> {
  final GeneratedDatabase _db;
  final String? _alias;
  Category(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _imgMeta = const VerificationMeta('img');
  late final GeneratedColumn<String?> img = GeneratedColumn<String?>(
      'img', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, name, img];
  @override
  String get aliasedName => _alias ?? 'category';
  @override
  String get actualTableName => 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CategoryData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Category createAlias(String alias) {
    return Category(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class CoffeeData extends DataClass implements Insertable<CoffeeData> {
  final int id;
  final int? cat;
  final String? brand;
  final String? label;
  final double? price;
  final double? discount;
  final int? weight;
  final String? img;
  final String? tt;
  final String? drink;
  final String? roast;
  final String? pack;
  final String? compound;
  final String? intensity;
  final String? origin;
  final String? life;
  final String? description;
  CoffeeData(
      {required this.id,
      this.cat,
      this.brand,
      this.label,
      this.price,
      this.discount,
      this.weight,
      this.img,
      this.tt,
      this.drink,
      this.roast,
      this.pack,
      this.compound,
      this.intensity,
      this.origin,
      this.life,
      this.description});
  factory CoffeeData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CoffeeData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      cat: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cat']),
      brand: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}brand']),
      label: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}label']),
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price']),
      discount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}discount']),
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      img: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}img']),
      tt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tt']),
      drink: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}drink']),
      roast: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}roast']),
      pack: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pack']),
      compound: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}compound']),
      intensity: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}intensity']),
      origin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}origin']),
      life: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}life']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || cat != null) {
      map['cat'] = Variable<int?>(cat);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String?>(brand);
    }
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String?>(label);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double?>(price);
    }
    if (!nullToAbsent || discount != null) {
      map['discount'] = Variable<double?>(discount);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int?>(weight);
    }
    if (!nullToAbsent || img != null) {
      map['img'] = Variable<String?>(img);
    }
    if (!nullToAbsent || tt != null) {
      map['tt'] = Variable<String?>(tt);
    }
    if (!nullToAbsent || drink != null) {
      map['drink'] = Variable<String?>(drink);
    }
    if (!nullToAbsent || roast != null) {
      map['roast'] = Variable<String?>(roast);
    }
    if (!nullToAbsent || pack != null) {
      map['pack'] = Variable<String?>(pack);
    }
    if (!nullToAbsent || compound != null) {
      map['compound'] = Variable<String?>(compound);
    }
    if (!nullToAbsent || intensity != null) {
      map['intensity'] = Variable<String?>(intensity);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String?>(origin);
    }
    if (!nullToAbsent || life != null) {
      map['life'] = Variable<String?>(life);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String?>(description);
    }
    return map;
  }

  CoffeeCompanion toCompanion(bool nullToAbsent) {
    return CoffeeCompanion(
      id: Value(id),
      cat: cat == null && nullToAbsent ? const Value.absent() : Value(cat),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      label:
          label == null && nullToAbsent ? const Value.absent() : Value(label),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      discount: discount == null && nullToAbsent
          ? const Value.absent()
          : Value(discount),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      img: img == null && nullToAbsent ? const Value.absent() : Value(img),
      tt: tt == null && nullToAbsent ? const Value.absent() : Value(tt),
      drink:
          drink == null && nullToAbsent ? const Value.absent() : Value(drink),
      roast:
          roast == null && nullToAbsent ? const Value.absent() : Value(roast),
      pack: pack == null && nullToAbsent ? const Value.absent() : Value(pack),
      compound: compound == null && nullToAbsent
          ? const Value.absent()
          : Value(compound),
      intensity: intensity == null && nullToAbsent
          ? const Value.absent()
          : Value(intensity),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      life: life == null && nullToAbsent ? const Value.absent() : Value(life),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory CoffeeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CoffeeData(
      id: serializer.fromJson<int>(json['id']),
      cat: serializer.fromJson<int?>(json['cat']),
      brand: serializer.fromJson<String?>(json['brand']),
      label: serializer.fromJson<String?>(json['label']),
      price: serializer.fromJson<double?>(json['price']),
      discount: serializer.fromJson<double?>(json['discount']),
      weight: serializer.fromJson<int?>(json['weight']),
      img: serializer.fromJson<String?>(json['img']),
      tt: serializer.fromJson<String?>(json['tt']),
      drink: serializer.fromJson<String?>(json['drink']),
      roast: serializer.fromJson<String?>(json['roast']),
      pack: serializer.fromJson<String?>(json['pack']),
      compound: serializer.fromJson<String?>(json['compound']),
      intensity: serializer.fromJson<String?>(json['intensity']),
      origin: serializer.fromJson<String?>(json['origin']),
      life: serializer.fromJson<String?>(json['life']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cat': serializer.toJson<int?>(cat),
      'brand': serializer.toJson<String?>(brand),
      'label': serializer.toJson<String?>(label),
      'price': serializer.toJson<double?>(price),
      'discount': serializer.toJson<double?>(discount),
      'weight': serializer.toJson<int?>(weight),
      'img': serializer.toJson<String?>(img),
      'tt': serializer.toJson<String?>(tt),
      'drink': serializer.toJson<String?>(drink),
      'roast': serializer.toJson<String?>(roast),
      'pack': serializer.toJson<String?>(pack),
      'compound': serializer.toJson<String?>(compound),
      'intensity': serializer.toJson<String?>(intensity),
      'origin': serializer.toJson<String?>(origin),
      'life': serializer.toJson<String?>(life),
      'description': serializer.toJson<String?>(description),
    };
  }

  CoffeeData copyWith(
          {int? id,
          int? cat,
          String? brand,
          String? label,
          double? price,
          double? discount,
          int? weight,
          String? img,
          String? tt,
          String? drink,
          String? roast,
          String? pack,
          String? compound,
          String? intensity,
          String? origin,
          String? life,
          String? description}) =>
      CoffeeData(
        id: id ?? this.id,
        cat: cat ?? this.cat,
        brand: brand ?? this.brand,
        label: label ?? this.label,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        weight: weight ?? this.weight,
        img: img ?? this.img,
        tt: tt ?? this.tt,
        drink: drink ?? this.drink,
        roast: roast ?? this.roast,
        pack: pack ?? this.pack,
        compound: compound ?? this.compound,
        intensity: intensity ?? this.intensity,
        origin: origin ?? this.origin,
        life: life ?? this.life,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('CoffeeData(')
          ..write('id: $id, ')
          ..write('cat: $cat, ')
          ..write('brand: $brand, ')
          ..write('label: $label, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('weight: $weight, ')
          ..write('img: $img, ')
          ..write('tt: $tt, ')
          ..write('drink: $drink, ')
          ..write('roast: $roast, ')
          ..write('pack: $pack, ')
          ..write('compound: $compound, ')
          ..write('intensity: $intensity, ')
          ..write('origin: $origin, ')
          ..write('life: $life, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          cat.hashCode,
          $mrjc(
              brand.hashCode,
              $mrjc(
                  label.hashCode,
                  $mrjc(
                      price.hashCode,
                      $mrjc(
                          discount.hashCode,
                          $mrjc(
                              weight.hashCode,
                              $mrjc(
                                  img.hashCode,
                                  $mrjc(
                                      tt.hashCode,
                                      $mrjc(
                                          drink.hashCode,
                                          $mrjc(
                                              roast.hashCode,
                                              $mrjc(
                                                  pack.hashCode,
                                                  $mrjc(
                                                      compound.hashCode,
                                                      $mrjc(
                                                          intensity.hashCode,
                                                          $mrjc(
                                                              origin.hashCode,
                                                              $mrjc(
                                                                  life.hashCode,
                                                                  description
                                                                      .hashCode)))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoffeeData &&
          other.id == this.id &&
          other.cat == this.cat &&
          other.brand == this.brand &&
          other.label == this.label &&
          other.price == this.price &&
          other.discount == this.discount &&
          other.weight == this.weight &&
          other.img == this.img &&
          other.tt == this.tt &&
          other.drink == this.drink &&
          other.roast == this.roast &&
          other.pack == this.pack &&
          other.compound == this.compound &&
          other.intensity == this.intensity &&
          other.origin == this.origin &&
          other.life == this.life &&
          other.description == this.description);
}

class CoffeeCompanion extends UpdateCompanion<CoffeeData> {
  final Value<int> id;
  final Value<int?> cat;
  final Value<String?> brand;
  final Value<String?> label;
  final Value<double?> price;
  final Value<double?> discount;
  final Value<int?> weight;
  final Value<String?> img;
  final Value<String?> tt;
  final Value<String?> drink;
  final Value<String?> roast;
  final Value<String?> pack;
  final Value<String?> compound;
  final Value<String?> intensity;
  final Value<String?> origin;
  final Value<String?> life;
  final Value<String?> description;
  const CoffeeCompanion({
    this.id = const Value.absent(),
    this.cat = const Value.absent(),
    this.brand = const Value.absent(),
    this.label = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.weight = const Value.absent(),
    this.img = const Value.absent(),
    this.tt = const Value.absent(),
    this.drink = const Value.absent(),
    this.roast = const Value.absent(),
    this.pack = const Value.absent(),
    this.compound = const Value.absent(),
    this.intensity = const Value.absent(),
    this.origin = const Value.absent(),
    this.life = const Value.absent(),
    this.description = const Value.absent(),
  });
  CoffeeCompanion.insert({
    this.id = const Value.absent(),
    this.cat = const Value.absent(),
    this.brand = const Value.absent(),
    this.label = const Value.absent(),
    this.price = const Value.absent(),
    this.discount = const Value.absent(),
    this.weight = const Value.absent(),
    this.img = const Value.absent(),
    this.tt = const Value.absent(),
    this.drink = const Value.absent(),
    this.roast = const Value.absent(),
    this.pack = const Value.absent(),
    this.compound = const Value.absent(),
    this.intensity = const Value.absent(),
    this.origin = const Value.absent(),
    this.life = const Value.absent(),
    this.description = const Value.absent(),
  });
  static Insertable<CoffeeData> custom({
    Expression<int>? id,
    Expression<int?>? cat,
    Expression<String?>? brand,
    Expression<String?>? label,
    Expression<double?>? price,
    Expression<double?>? discount,
    Expression<int?>? weight,
    Expression<String?>? img,
    Expression<String?>? tt,
    Expression<String?>? drink,
    Expression<String?>? roast,
    Expression<String?>? pack,
    Expression<String?>? compound,
    Expression<String?>? intensity,
    Expression<String?>? origin,
    Expression<String?>? life,
    Expression<String?>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cat != null) 'cat': cat,
      if (brand != null) 'brand': brand,
      if (label != null) 'label': label,
      if (price != null) 'price': price,
      if (discount != null) 'discount': discount,
      if (weight != null) 'weight': weight,
      if (img != null) 'img': img,
      if (tt != null) 'tt': tt,
      if (drink != null) 'drink': drink,
      if (roast != null) 'roast': roast,
      if (pack != null) 'pack': pack,
      if (compound != null) 'compound': compound,
      if (intensity != null) 'intensity': intensity,
      if (origin != null) 'origin': origin,
      if (life != null) 'life': life,
      if (description != null) 'description': description,
    });
  }

  CoffeeCompanion copyWith(
      {Value<int>? id,
      Value<int?>? cat,
      Value<String?>? brand,
      Value<String?>? label,
      Value<double?>? price,
      Value<double?>? discount,
      Value<int?>? weight,
      Value<String?>? img,
      Value<String?>? tt,
      Value<String?>? drink,
      Value<String?>? roast,
      Value<String?>? pack,
      Value<String?>? compound,
      Value<String?>? intensity,
      Value<String?>? origin,
      Value<String?>? life,
      Value<String?>? description}) {
    return CoffeeCompanion(
      id: id ?? this.id,
      cat: cat ?? this.cat,
      brand: brand ?? this.brand,
      label: label ?? this.label,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      weight: weight ?? this.weight,
      img: img ?? this.img,
      tt: tt ?? this.tt,
      drink: drink ?? this.drink,
      roast: roast ?? this.roast,
      pack: pack ?? this.pack,
      compound: compound ?? this.compound,
      intensity: intensity ?? this.intensity,
      origin: origin ?? this.origin,
      life: life ?? this.life,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cat.present) {
      map['cat'] = Variable<int?>(cat.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String?>(brand.value);
    }
    if (label.present) {
      map['label'] = Variable<String?>(label.value);
    }
    if (price.present) {
      map['price'] = Variable<double?>(price.value);
    }
    if (discount.present) {
      map['discount'] = Variable<double?>(discount.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int?>(weight.value);
    }
    if (img.present) {
      map['img'] = Variable<String?>(img.value);
    }
    if (tt.present) {
      map['tt'] = Variable<String?>(tt.value);
    }
    if (drink.present) {
      map['drink'] = Variable<String?>(drink.value);
    }
    if (roast.present) {
      map['roast'] = Variable<String?>(roast.value);
    }
    if (pack.present) {
      map['pack'] = Variable<String?>(pack.value);
    }
    if (compound.present) {
      map['compound'] = Variable<String?>(compound.value);
    }
    if (intensity.present) {
      map['intensity'] = Variable<String?>(intensity.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String?>(origin.value);
    }
    if (life.present) {
      map['life'] = Variable<String?>(life.value);
    }
    if (description.present) {
      map['description'] = Variable<String?>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoffeeCompanion(')
          ..write('id: $id, ')
          ..write('cat: $cat, ')
          ..write('brand: $brand, ')
          ..write('label: $label, ')
          ..write('price: $price, ')
          ..write('discount: $discount, ')
          ..write('weight: $weight, ')
          ..write('img: $img, ')
          ..write('tt: $tt, ')
          ..write('drink: $drink, ')
          ..write('roast: $roast, ')
          ..write('pack: $pack, ')
          ..write('compound: $compound, ')
          ..write('intensity: $intensity, ')
          ..write('origin: $origin, ')
          ..write('life: $life, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class Coffee extends Table with TableInfo<Coffee, CoffeeData> {
  final GeneratedDatabase _db;
  final String? _alias;
  Coffee(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _catMeta = const VerificationMeta('cat');
  late final GeneratedColumn<int?> cat = GeneratedColumn<int?>(
      'cat', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _brandMeta = const VerificationMeta('brand');
  late final GeneratedColumn<String?> brand = GeneratedColumn<String?>(
      'brand', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  late final GeneratedColumn<String?> label = GeneratedColumn<String?>(
      'label', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _discountMeta = const VerificationMeta('discount');
  late final GeneratedColumn<double?> discount = GeneratedColumn<double?>(
      'discount', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, true,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 1000',
      defaultValue: const CustomExpression<int>('1000'));
  final VerificationMeta _imgMeta = const VerificationMeta('img');
  late final GeneratedColumn<String?> img = GeneratedColumn<String?>(
      'img', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _ttMeta = const VerificationMeta('tt');
  late final GeneratedColumn<String?> tt = GeneratedColumn<String?>(
      'tt', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _drinkMeta = const VerificationMeta('drink');
  late final GeneratedColumn<String?> drink = GeneratedColumn<String?>(
      'drink', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _roastMeta = const VerificationMeta('roast');
  late final GeneratedColumn<String?> roast = GeneratedColumn<String?>(
      'roast', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _packMeta = const VerificationMeta('pack');
  late final GeneratedColumn<String?> pack = GeneratedColumn<String?>(
      'pack', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _compoundMeta = const VerificationMeta('compound');
  late final GeneratedColumn<String?> compound = GeneratedColumn<String?>(
      'compound', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _intensityMeta = const VerificationMeta('intensity');
  late final GeneratedColumn<String?> intensity = GeneratedColumn<String?>(
      'intensity', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _originMeta = const VerificationMeta('origin');
  late final GeneratedColumn<String?> origin = GeneratedColumn<String?>(
      'origin', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _lifeMeta = const VerificationMeta('life');
  late final GeneratedColumn<String?> life = GeneratedColumn<String?>(
      'life', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        cat,
        brand,
        label,
        price,
        discount,
        weight,
        img,
        tt,
        drink,
        roast,
        pack,
        compound,
        intensity,
        origin,
        life,
        description
      ];
  @override
  String get aliasedName => _alias ?? 'coffee';
  @override
  String get actualTableName => 'coffee';
  @override
  VerificationContext validateIntegrity(Insertable<CoffeeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cat')) {
      context.handle(
          _catMeta, cat.isAcceptableOrUnknown(data['cat']!, _catMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('img')) {
      context.handle(
          _imgMeta, img.isAcceptableOrUnknown(data['img']!, _imgMeta));
    }
    if (data.containsKey('tt')) {
      context.handle(_ttMeta, tt.isAcceptableOrUnknown(data['tt']!, _ttMeta));
    }
    if (data.containsKey('drink')) {
      context.handle(
          _drinkMeta, drink.isAcceptableOrUnknown(data['drink']!, _drinkMeta));
    }
    if (data.containsKey('roast')) {
      context.handle(
          _roastMeta, roast.isAcceptableOrUnknown(data['roast']!, _roastMeta));
    }
    if (data.containsKey('pack')) {
      context.handle(
          _packMeta, pack.isAcceptableOrUnknown(data['pack']!, _packMeta));
    }
    if (data.containsKey('compound')) {
      context.handle(_compoundMeta,
          compound.isAcceptableOrUnknown(data['compound']!, _compoundMeta));
    }
    if (data.containsKey('intensity')) {
      context.handle(_intensityMeta,
          intensity.isAcceptableOrUnknown(data['intensity']!, _intensityMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('life')) {
      context.handle(
          _lifeMeta, life.isAcceptableOrUnknown(data['life']!, _lifeMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoffeeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CoffeeData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Coffee createAlias(String alias) {
    return Coffee(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class FavoriteData extends DataClass implements Insertable<FavoriteData> {
  final int id;
  FavoriteData({required this.id});
  factory FavoriteData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FavoriteData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  FavoriteCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCompanion(
      id: Value(id),
    );
  }

  factory FavoriteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FavoriteData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  FavoriteData copyWith({int? id}) => FavoriteData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(id.hashCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is FavoriteData && other.id == this.id);
}

class FavoriteCompanion extends UpdateCompanion<FavoriteData> {
  final Value<int> id;
  const FavoriteCompanion({
    this.id = const Value.absent(),
  });
  FavoriteCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<FavoriteData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  FavoriteCompanion copyWith({Value<int>? id}) {
    return FavoriteCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class Favorite extends Table with TableInfo<Favorite, FavoriteData> {
  final GeneratedDatabase _db;
  final String? _alias;
  Favorite(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'favorite';
  @override
  String get actualTableName => 'favorite';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FavoriteData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Favorite createAlias(String alias) {
    return Favorite(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserProfileData extends DataClass implements Insertable<UserProfileData> {
  final String name;
  final String? phone;
  final String? email;
  UserProfileData({required this.name, this.phone, this.email});
  factory UserProfileData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserProfileData(
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String?>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String?>(email);
    }
    return map;
  }

  UserProfileCompanion toCompanion(bool nullToAbsent) {
    return UserProfileCompanion(
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory UserProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserProfileData(
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
    };
  }

  UserProfileData copyWith({String? name, String? phone, String? email}) =>
      UserProfileData(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('UserProfileData(')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(name.hashCode, $mrjc(phone.hashCode, email.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileData &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email);
}

class UserProfileCompanion extends UpdateCompanion<UserProfileData> {
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  const UserProfileCompanion({
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
  });
  UserProfileCompanion.insert({
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
  }) : name = Value(name);
  static Insertable<UserProfileData> custom({
    Expression<String>? name,
    Expression<String?>? phone,
    Expression<String?>? email,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
    });
  }

  UserProfileCompanion copyWith(
      {Value<String>? name, Value<String?>? phone, Value<String?>? email}) {
    return UserProfileCompanion(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String?>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String?>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileCompanion(')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class UserProfile extends Table with TableInfo<UserProfile, UserProfileData> {
  final GeneratedDatabase _db;
  final String? _alias;
  UserProfile(this._db, [this._alias]);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false, $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name, phone, email];
  @override
  String get aliasedName => _alias ?? 'userProfile';
  @override
  String get actualTableName => 'userProfile';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  UserProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserProfileData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  UserProfile createAlias(String alias) {
    return UserProfile(_db, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MoorDb extends GeneratedDatabase {
  _$MoorDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Category category = Category(this);
  late final Coffee coffee = Coffee(this);
  late final Favorite favorite = Favorite(this);
  late final UserProfile userProfile = UserProfile(this);
  Selectable<CoffeeData> getDiscountsList() {
    return customSelect('SELECT * from coffee WHERE discount > 0 LIMIT 10',
        variables: [],
        readsFrom: {
          coffee,
        }).map(coffee.mapFromRow);
  }

  Selectable<CoffeeData> getPopularList() {
    return customSelect('SELECT * from coffee WHERE id % 8 = 0 LIMIT 10',
        variables: [],
        readsFrom: {
          coffee,
        }).map(coffee.mapFromRow);
  }

  Selectable<CoffeeData> getByCategory(int id) {
    return customSelect('SELECT * FROM coffee where cat = :id', variables: [
      Variable<int>(id)
    ], readsFrom: {
      coffee,
    }).map(coffee.mapFromRow);
  }

  Selectable<CategoryData> getAllCategory() {
    return customSelect('SELECT * FROM category', variables: [], readsFrom: {
      category,
    }).map(category.mapFromRow);
  }

  Future<int> addFavorite(int id) {
    return customInsert(
      'INSERT OR IGNORE INTO favorite (id) VALUES (:id)',
      variables: [Variable<int>(id)],
      updates: {favorite},
    );
  }

  Future<int> remFavorite(int id) {
    return customUpdate(
      'DELETE FROM favorite WHERE id = :id',
      variables: [Variable<int>(id)],
      updates: {favorite},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<int> isFavorite(int id) {
    return customSelect('SELECT count(id) FROM favorite WHERE id = :id',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          favorite,
        }).map((QueryRow row) => row.read<int>('count(id)'));
  }

  Selectable<CoffeeData> getAllFavoriteList() {
    return customSelect(
        'SELECT * FROM coffee WHERE id IN (SELECT id FROM favorite)',
        variables: [],
        readsFrom: {
          coffee,
          favorite,
        }).map(coffee.mapFromRow);
  }

  Future<int> userInsert(String name, String phone, String email) {
    return customInsert(
      'INSERT OR IGNORE INTO userProfile (name, phone, email) VALUES (:name, :phone, :email)',
      variables: [
        Variable<String>(name),
        Variable<String>(phone),
        Variable<String>(email)
      ],
      updates: {userProfile},
    );
  }

  Future<int> userUpdate(String name, String? phone, String? email) {
    return customUpdate(
      'UPDATE userProfile SET name = :name, phone = :phone, email = :email',
      variables: [
        Variable<String>(name),
        Variable<String?>(phone),
        Variable<String?>(email)
      ],
      updates: {userProfile},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<int> userSelectCount() {
    return customSelect('SELECT count(name) FROM userProfile',
        variables: [],
        readsFrom: {
          userProfile,
        }).map((QueryRow row) => row.read<int>('count(name)'));
  }

  Selectable<UserProfileData> userSelect() {
    return customSelect('SELECT name, phone, email FROM userProfile',
        variables: [],
        readsFrom: {
          userProfile,
        }).map(userProfile.mapFromRow);
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [category, coffee, favorite, userProfile];
}
