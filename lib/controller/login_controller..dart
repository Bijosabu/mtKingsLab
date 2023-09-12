import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mtkingslab/view/homePage/home_page.dart';

class LoginController extends GetxController {
  static final RxString username = RxString('');
  static final RxString password = RxString('');

  static void setUsername(String value) {
    username.value = value;
  }

  static void setPassword(String value) {
    password.value = value;
  }

  static Future<void> login() async {
    final enteredUsername = username.value;
    final enteredPassword = password.value;
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      headers: headers,
      body: jsonEncode(
        {
          'username': enteredUsername,
          'password': enteredPassword,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
      }
      Get.to(HomePage());
    } else {
      Get.snackbar('Login Failed', response.body);
    }
  }
}
