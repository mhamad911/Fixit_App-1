import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskProvider with ChangeNotifier {
  bool taskSubmitted = false; // حالة لتخزين حالة إرسال المهمة

  final titleController = TextEditingController();
  final describeController = TextEditingController();
  final locationController = TextEditingController();
  String selectedCountry = '';
  String selectedCity = '';
  List<File> images = [];
  String targetUrl = '';// متغير لتخزين عنوان الوجهة
  String _buttonText = 'Accept';
  String _buttonText2='Hire Now';

  String get buttonText => _buttonText;
  String get buttonText2=> _buttonText2;

  void updateButtonText2(String newText2){
    _buttonText2=newText2;
    notifyListeners();
  }

  void updateButtonText(String newText) {
    _buttonText = newText;
    notifyListeners();
  }
  // تعيين عنوان الوجهة
  void setTargetUrl(String url) {
    targetUrl = url;
    notifyListeners();
  }

  Future<void> submitTask() async {
    taskSubmitted = true;
    notifyListeners();
    if (targetUrl.isEmpty) {
      print('Target URL is not set');
      return;

    }

    final uri = Uri.parse(targetUrl);
    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = titleController.text;
    request.fields['description'] = describeController.text;
    request.fields['location'] = locationController.text;
    request.fields['country'] = selectedCountry;
    request.fields['city'] = selectedCity;

    for (var image in images) {
      request.files.add(
          await http.MultipartFile.fromPath('images[]', image.path));
    }

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Task submitted successfully');
      } else {
        print('Failed to submit task');
      }
    } catch (e) {
      print('Error: $e');
    }

  }
}
