import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool isAuthenticated = false;
  String errorMessage = '';
  String userType = '';

  Future<void> signIn(String username, String password) async {
    final url = Uri.parse('https://odai.com/signin');
    final res = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (res.statusCode == 200) {
      final responseData = json.decode(res.body);
      isAuthenticated = true;
      userType = responseData['userType'];
      notifyListeners();
    } else {
      errorMessage = 'Login failed';
      notifyListeners();
    }
  }

  Future<void> signUp(Map<String, dynamic> signUpData) async {
    final url = Uri.parse('https://odai.com/signup');
    final res = await http.post(
      url,
      body: json.encode(signUpData),
      headers: {'Content-Type': 'application/json'},
    );

    if (res.statusCode == 201) {
      isAuthenticated = true;
      notifyListeners();
    } else {
      errorMessage = 'Signup failed';
      notifyListeners();
    }
  }
}
