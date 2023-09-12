// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtkingslab/controller/product_controller.dart';
import 'package:mtkingslab/view/homePage/home_page.dart';
import 'package:mtkingslab/view/homePage/single_product.dart';

class ProductPage extends StatelessWidget {
  final int id;
  ProductPage({super.key, required this.id});
  final singleProductController = Get.find<ProductController>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController thumbnailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      singleProductController.fetchProductById(id);
    });

    return Scaffold(
      appBar: AppBar(),
      body: GetX<ProductController>(builder: (singleProductController) {
        final product = singleProductController.product.value;

        if (product == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          titleController.text = product.title!;
          priceController.text = product.price.toString();
          thumbnailController.text = product.thumbnail!;
          descriptionController.text = product.description!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleProduct(
                  showEditButton: false,
                  id: id,
                  firstImage: product.images![0],
                  title: product.title!,
                  description: product.description!,
                  price: product.price!,
                  discountPercentage: product.discountPercentage!,
                  rating: product.rating!,
                  stock: product.stock!,
                  brand: product.brand!,
                  category: product.category!,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Update Product Data:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(labelText: 'Price'),
                      ),
                      TextField(
                        controller: thumbnailController,
                        decoration:
                            const InputDecoration(labelText: 'Thumbnail URL'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          final updatedData = {
                            "title": titleController.text,
                            "price": double.tryParse(priceController.text) ??
                                product.price,
                            "thumbnail": thumbnailController.text,
                            "description": descriptionController.text,
                          };

                          singleProductController.updateProducts(
                              id, updatedData);
                          Get.to(HomePage());
                        },
                        child: const Text('Update Product'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
