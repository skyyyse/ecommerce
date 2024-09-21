import 'package:ecommerce/model/image_model.dart';

class product{
  final int id;
  final String title;
  final String description;
  final double price;
  final int qty;
  final int subcategories_id;
  List<image_model> images;
  List<favorites> favorite;
  product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.qty,
    required this.subcategories_id,
    required this.images,
    required this.favorite,
  });
  factory product.fromJson(Map<String, dynamic> json) {
    return product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      qty: json['qty'],
      subcategories_id: json['subcategories_id'],
      images: (json['image'] as List).map((image) => image_model.fromjson(image)).toList(),
      favorite: (json['favorite'] as List).map((favorite) => favorites.fromJson(favorite)).toList(),
    );
  }
}
class favorites {
  final int id;
  final int user_id;
  final int product_id;
  favorites({
    required this.id,
    required this.user_id,
    required this.product_id,
  });
  factory favorites.fromJson(Map<String, dynamic> json) {
    return favorites(
      id: json['id'],
      user_id: json['user_id'],
      product_id: json['product_id'],
    );
  }
}