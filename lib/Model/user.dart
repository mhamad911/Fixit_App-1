class User {
  final String email;
  final String number;
  final String name;
  final String category;
  final String local;

  User({
    required this.email,
    required this.number,
    required this.name,
    required this.category,
    required this.local,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      number: json['number'],
      name: json['name'],
      category: json['category'],
      local: json['local'],
    );
  }
}
