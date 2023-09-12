import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mtkingslab/model/product_model.dart';
import 'package:mtkingslab/model/web_services.dart';

class ProductController extends GetxController {
  final ApiCalls apicalls = ApiCalls();
  final RxList<Product> products = <Product>[].obs;
  final Rx<Product> product = Product().obs;
  final Rx<Product> updatedProduct = Product().obs;
  void fetchProductsModel() async {
    List<Product> fetchedProduct = await apicalls.getProducts();

    products.value = fetchedProduct;
    update();
  }

  void fetchProductById(int id) async {
    Product singleProduct = await apicalls.getProductsById(id);
    if (kDebugMode) {
      print(singleProduct);
    }
    product.value = singleProduct;
    update();
  }

  void updateProducts(int id, Map<String, dynamic> updatedData) async {
    apicalls.updatedProduct(id, updatedData);
  }
}
