import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'net_models.g.dart';

@JsonSerializable()
class APIAllQuery {
  factory APIAllQuery.fromJson(Map<String, dynamic> json) => _$APIAllQueryFromJson(json);
  Map<String, dynamic> toJson() => _$APIAllQueryToJson(this);

  List<APIClist> clist;
  List<APICatalog> catalog;

  APIAllQuery({
    required this.clist,
    required this.catalog
  });
}

@JsonSerializable()
class APIClist {
  factory APIClist.fromJson(Map<String, dynamic> json) =>
      _$APIClistFromJson(json);
  Map<String, dynamic> toJson() => _$APIClistToJson(this);

  APICoffee coffee;

  APIClist({
    required this.coffee
  });
}

@JsonSerializable()
class APICoffee extends Equatable {
  final int id;
  final int cat;
  final String brand;
  final String label;
  final double price;
  final double discount;
  final int weight;
  final String img;
  final String tt;
  final String drink;
  final String roast;
  final String pack;
  final String compound;
  final String intensity;
  final String origin;
  final String life;
  final String description;

  APICoffee({
    required this.id,
    required this.cat,
    required this.brand,
    required this.label,
    required this.price,
    required this.discount,
    required this.weight,
    required this.img,
    required this.tt,
    required this.drink,
    required this.roast,
    required this.pack,
    required this.compound,
    required this.intensity,
    required this.origin,
    required this.life,
    required this.description
  });

  factory APICoffee.fromJson(Map<String, dynamic> json) =>
      _$APICoffeeFromJson(json);
  Map<String, dynamic> toJson() => _$APICoffeeToJson(this);

  @override
  List<Object?> get props => [id];
}

@JsonSerializable()
class APICatalog {
  factory APICatalog.fromJson(Map<String, dynamic> json) => _$APICatalogFromJson(json);
  Map<String, dynamic> toJson() => _$APICatalogToJson(this);

  APICategory category;

  APICatalog({
    required this.category
  });
}

@JsonSerializable()
class APICategory extends Equatable {
  factory APICategory.fromJson(Map<String, dynamic> json) => _$APICategoryFromJson(json);
  Map<String, dynamic> toJson() => _$APICategoryToJson(this);

  final int id;
  final String name;
  final String img;

  APICategory({
    required this.id,
    required this.name,
    required this.img
  });

  @override
  List<Object?> get props => [id];
}