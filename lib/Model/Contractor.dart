class Contractor {
  final int id;
  final String userName;
  final String email;
  final String number;
  final String country;
  final String city;
  final String address;
  final String type;
  final String service_type;
  final String? description; // Nullable field
  final DateTime createdAt;
  final DateTime updatedAt;

  Contractor({
    required this.id,
    required this.userName,
    required this.email,
    required this.number,
    required this.country,
    required this.city,
    required this.address,
    required this.type,
    required this.service_type,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Contractor.fromJson(Map<String, dynamic> json) {
    return Contractor(
      id: json['id'],
      userName: json['user_name'],
      email: json['email'],
      number: json['number'],
      country: json['country'],
      city: json['city'],
      address: json['address'],
      type: json['type'],
      service_type: json['service_type'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
