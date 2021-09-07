// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIAllQuery _$APIAllQueryFromJson(Map<String, dynamic> json) {
  return APIAllQuery(
    clist: (json['clist'] as List<dynamic>)
        .map((e) => APIClist.fromJson(e as Map<String, dynamic>))
        .toList(),
    catalog: (json['catalog'] as List<dynamic>)
        .map((e) => APICatalog.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$APIAllQueryToJson(APIAllQuery instance) =>
    <String, dynamic>{
      'clist': instance.clist,
      'catalog': instance.catalog,
    };

APIClist _$APIClistFromJson(Map<String, dynamic> json) {
  return APIClist(
    coffee: APICoffee.fromJson(json['coffee'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APIClistToJson(APIClist instance) => <String, dynamic>{
      'coffee': instance.coffee,
    };

APICoffee _$APICoffeeFromJson(Map<String, dynamic> json) {
  return APICoffee(
    id: json['id'] as int,
    cat: json['cat'] as int,
    brand: json['brand'] as String,
    label: json['label'] as String,
    price: (json['price'] as num).toDouble(),
    discount: (json['discount'] as num).toDouble(),
    weight: json['weight'] as int,
    img: json['img'] as String,
    tt: json['tt'] as String,
    drink: json['drink'] as String,
    roast: json['roast'] as String,
    pack: json['pack'] as String,
    compound: json['compound'] as String,
    intensity: json['intensity'] as String,
    origin: json['origin'] as String,
    life: json['life'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$APICoffeeToJson(APICoffee instance) => <String, dynamic>{
      'id': instance.id,
      'cat': instance.cat,
      'brand': instance.brand,
      'label': instance.label,
      'price': instance.price,
      'discount': instance.discount,
      'weight': instance.weight,
      'img': instance.img,
      'tt': instance.tt,
      'drink': instance.drink,
      'roast': instance.roast,
      'pack': instance.pack,
      'compound': instance.compound,
      'intensity': instance.intensity,
      'origin': instance.origin,
      'life': instance.life,
      'description': instance.description,
    };

APICatalog _$APICatalogFromJson(Map<String, dynamic> json) {
  return APICatalog(
    category: APICategory.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$APICatalogToJson(APICatalog instance) =>
    <String, dynamic>{
      'category': instance.category,
    };

APICategory _$APICategoryFromJson(Map<String, dynamic> json) {
  return APICategory(
    id: json['id'] as int,
    name: json['name'] as String,
    img: json['img'] as String,
  );
}

Map<String, dynamic> _$APICategoryToJson(APICategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
    };
