import 'package:ecommerce/model/favorite_model.dart';
import 'package:ecommerce/model/image_model.dart';
class product_model{
  final int id;
  final String title;
  final String description;
  final double price;
  final int qty;
  final int subcategories_id;
  final List<image_model> images;
  product_model({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.qty,
    required this.subcategories_id,
    required this.images,
  });
  factory product_model.fromJson(Map<String, dynamic> json) {
    return product_model(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      qty: json['qty'],
      subcategories_id: json['subcategories_id'],
      images: (json['image'] as List).map((image) => image_model.fromjson(image)).toList(),
    );
  }
}