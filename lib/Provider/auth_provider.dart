import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/user.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _errorMessage = '';
  String? _userType;
  String? _token;

  bool get isAuthenticated => _isAuthenticated;
  String get errorMessage => _errorMessage;
  String? get userType => _userType;
  String? get token =>_token;

  Future<void> signUp(User user) async {
    final url = Uri.parse('https://fixit-be.onrender.com/user/');

    try {
      final requestBody = json.encode(user.toJson());
      print('Request body: $requestBody');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        _isAuthenticated = true;
        _errorMessage = '';
        _userType = user.type;
      } else if (response.statusCode == 400) {
        _isAuthenticated = false;
        final responseData = json.decode(response.body);
        _errorMessage = responseData['message'] ?? 'Invalid request data. Please check your input.';
      } else {
        _isAuthenticated = false;
        _errorMessage = 'Failed to register. Please try again.';
      }
      notifyListeners();
    } catch (error) {
      _isAuthenticated = false;
      _errorMessage = 'Failed to register due to a network or server error. Please try again.';
      notifyListeners();
    }
  }


  Future<void> signIn(String email, String password) async {
    final url = Uri.parse('https://fixit-be.onrender.com/user/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _isAuthenticated = true;
        _errorMessage = '';
        _userType = responseData['user']['type'];
        _token = responseData['user']['token'];
        notifyListeners();
      } else {
        _isAuthenticated = false;
        _errorMessage = 'Failed to sign in. Please try again.';
        notifyListeners();
      }
    } catch (error) {
      _isAuthenticated = false;
      _errorMessage = 'Failed to sign in. Please try again.';
      notifyListeners();
    }
  }

  void signOut() {
    _isAuthenticated = false;
    _errorMessage = '';
    _userType = null;
    _token = null;
    notifyListeners();
  }
}