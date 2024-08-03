class User {
  final String userName;
  final String email;
  final String password;
  final String number;
  final String country;
  final String city;
  final String address;
  final String type;
  final String service_type;

  User({
    required this.userName,
    required this.email,
    required this.password,
    required this.number,
    required this.country,
    required this.city,
    required this.address,
    required this.type,
    required this.service_type
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      email: json['email'],
      password: json['password'],
      number: json['number'],
      country: json['country'],
      city: json['city'],
      address: json['address'],
      type: json['type'],
      service_type: json['serviceType'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'email': email,
      'password': password,
      'number': number,
      'country': country,
      'city': city,
      'address': address,
      'type': type,
      'serviceType': service_type
    };
  }
}
