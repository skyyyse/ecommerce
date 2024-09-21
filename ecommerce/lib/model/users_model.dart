class user_model{
  final int id;
  late final String username;
  final String? phone;
  final String email; // Nullable
  final String? address; // Nullable
  final String? image;
  user_model({
    required this.id,
    required this.username,
    this.phone,
    required this.email, // Nullable
    this.address, // Nullable
    this.image,
  });
  factory user_model.fromjson(Map<String,dynamic>json){
    return user_model(
      id: json['id'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'], // Make sure the key is 'email' in lowercase
      address: json['address'], // Make sure the key is 'address' in lowercase
      image: json['image'],
    );
  }
}