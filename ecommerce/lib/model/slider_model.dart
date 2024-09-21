class slider_model {
  final int id;
  final String title;
  final String image;
  slider_model({
    required this.id,
    required this.image,
    required this.title,
  });
  factory slider_model.fromjson(Map<String,dynamic>json){
    return slider_model(
      id: json['id'],
      title: json['title'],
      image:json['image'],
    );
  }
}