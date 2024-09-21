import 'package:ecommerce/model/image_model.dart';
import 'package:ecommerce/model/product_model.dart';

class order_model{
  final int id;
  final int user_id;
  final int totalprice;
  List<item_model>item;
  order_model({
    required this.id,
    required this.user_id,
    required this.totalprice,
    required this.item,
  });
  factory order_model.fromjson(Map<String,dynamic>json){
    return order_model(
      id:json['id'],
      user_id:json['user_id'],
      totalprice:json['totalprice'],
      item:(json['item'] as List).map((item) => item_model.fromjson(item)).toList(),
    );
  }
}

class item_model{
  final int id;
  final int order_id;
  final int product_id;
  final int qty;
  product_model product;
  item_model({
    required this.id,
    required this.order_id,
    required this.qty,
    required this.product_id,
    required this.product
  });
  factory item_model.fromjson(Map<String,dynamic>json){
    return item_model(
      id:json['id'],
      order_id:json['order_id'],
      qty:json['qty'],
      product_id:json['product_id'],
      product:product_model.fromJson(json['product']),
    );
  }
}
