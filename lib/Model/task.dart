import 'dart:io';

class Task {
  final String title;
  final String description;
  final String location;
  final String country;
  final String city;
  final File? image;

  Task({
    required this.title,
    required this.description,
    required this.location,
    required this.country,
    required this.city,
    this.image,
  });

  Map<String, String> toMap() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'country': country,
      'city': city,
      // Note: Image path is not included in the map
    };
  }
}
