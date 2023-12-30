class ProductModel {
  final int? id;
  final String name;
  final String price;
  final String brand;
  final String? createdAt;
  final String? updatedAt;
  ProductModel({
    this.id,
    required this.price,
    required this.brand,
    required this.name,
    this.createdAt,
    this.updatedAt
  });

  factory ProductModel.fromSqfliteDatabase(Map<String,dynamic>map) => ProductModel(
    id: map['id']?.toInt() ?? 0,
    name: map['name'] ?? '',
    price: map['price'] ?? '0',
    brand: map['brand'] ?? '',
    createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']).toIso8601String(),
    updatedAt: map['updatedAt'] == null
      ? null
        : DateTime.fromMillisecondsSinceEpoch(map['updatedAt']).toIso8601String(),
  );
}