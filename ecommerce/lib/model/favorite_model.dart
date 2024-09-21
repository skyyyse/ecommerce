import 'package:ecommerce/model/product_model.dart';
class favorite_model {
  final int id;
  final int user_id;
  final int product_id;
  product_model product;
  favorite_model({
    required this.id,
    required this.user_id,
    required this.product_id,
    required this.product,
  });
  factory favorite_model.fromJson(Map<String, dynamic> json) {
    return favorite_model(
      id: json['id'],
      user_id: json['user_id'],
      product_id: json['product_id'],
      product: product_model.fromJson(json['product']),
    );
  }
}