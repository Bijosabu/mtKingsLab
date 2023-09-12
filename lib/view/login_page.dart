// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mtkingslab/controller/login_controller..dart';
import 'package:mtkingslab/view/homePage/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });
  void loginUser(context) {
    final url = Uri.parse('https://dummyjson.com/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final data = {
      'username': 'kminchelle',
      'password': '0lelplR',
    };

    http
        .post(
      url,
      headers: headers,
      body: jsonEncode(data),
    )
        .then(
      (response) {
        if (response.statusCode == 200) {
          print(jsonDecode(response.body));
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ));
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    LoginController.setUsername(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    LoginController.setPassword(value);
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    LoginController.login();
                  },
                  child: const Text('Login'),
                ),
              ],
            )),
      ),
    );
  }
}
