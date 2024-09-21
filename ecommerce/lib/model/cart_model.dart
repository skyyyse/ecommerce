import 'package:ecommerce/model/product_model.dart';
class cart_model {
  final int id;
  final int user_id;
  final int product_id;
  final int qty;
  final double totalprice;
  product_model product;
  cart_model({
    required this.id,
    required this.user_id,
    required this.product_id,
    required this.qty,
    required this.product,
    required this.totalprice,
  });
  factory cart_model.fromjson(Map<String, dynamic> json) {
    return cart_model(
      id: json['id'],
      user_id: json['user_id'],
      product_id: json['product_id'],
      qty: json['qty'],
      totalprice: double.parse(json['totalprice'].toString()),
      product: product_model.fromJson(json['product']),
    );
  }
}
