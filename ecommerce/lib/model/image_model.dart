class image_model{
  final int id;
  final String image;
  final int product_id;
  image_model({
    required this.id,
    required this.image,
    required this.product_id,
  });
  factory image_model.fromjson(Map<String,dynamic>json){
    return image_model(
      id:json['id'],
      image:json['image'],
      product_id:json['product_id'],
    );
  }
}