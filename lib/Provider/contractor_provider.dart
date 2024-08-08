import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/Contractor.dart';

class ContractorProvider with ChangeNotifier {
  List<Contractor> contractors = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchContractors(String service_type) async {
    final url = Uri.parse('https://fixit-be.onrender.com/user/workers?service_type=$service_type');
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final res = await http.get(url);

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 200 || res.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(res.body);
        if (data.containsKey('workers')) {
          contractors = (data['workers'] as List).map((json) => Contractor.fromJson(json)).toList();
        } else {
          errorMessage = 'Unexpected data format';
        }
      } else {
        errorMessage = 'Failed to load contractors. Server returned an error: ${res.statusCode}';
      }
    } catch (error) {
      errorMessage = 'Failed to load contractors. Please try again later.';
      print('Error fetching contractors: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

}
