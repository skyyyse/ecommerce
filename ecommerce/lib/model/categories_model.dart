class categories_model{
  final int id;
  final String title;
  final String image;
  categories_model({
    required this.id,
    required this.title,
    required this.image
  });

  factory categories_model.fromJson(Map<String, dynamic> json) {
    return categories_model(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}