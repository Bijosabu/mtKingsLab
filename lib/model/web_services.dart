import 'dart:convert';

import 'package:get/get.dart';
import 'package:mtkingslab/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['products'];
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw 'Failed to fetch products';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Product> getProductsById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products/$id'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Product.fromJson(data);
      } else {
        throw 'Failed to fetch products';
      }
    } catch (e) {
      throw e.toString();
    }
  }

  void updatedProduct(int id, Map<String, dynamic> updatedData) async {
    try {
      final response = await http.put(
        Uri.parse('https://dummyjson.com/products/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Done!', 'Updated Successfully');
      } else {
        throw 'Failed to update product with ID: $id';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
