class ServiceClass {
  final int id;
  final String name;
  final double price;
  final String no;
  final int? taxId;
  final List<Collection> brands;
  final List<Collection> models;

  ServiceClass({
    required this.id,
    required this.name,
    required this.price,
    required this.no,
    this.taxId,
    required this.brands,
    required this.models,
  });

  factory ServiceClass.fromJson(Map<String, dynamic> json) => ServiceClass(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      no: json['no'],
      brands: List<Collection>.from(json['Brand'].map((e) => Collection.fromJson(e))),
      models: List<Collection>.from(json['Model'].map((e) => Collection.fromJson(e))),);
}

class Collection{
  final int id;
  final String name;
  final int? brandId;

  Collection({
    required this.id,
    required this.name,
    this.brandId,
});
  factory Collection.fromJson(Map<String,dynamic> json) => Collection(id: json['id'], name: json['name'],brandId: json['brandId']);
}