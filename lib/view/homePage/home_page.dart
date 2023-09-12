import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtkingslab/controller/product_controller.dart';
import 'package:mtkingslab/view/homePage/single_product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProductsModel();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetX<ProductController>(builder: (productController) {
        if (productController.products.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            return SingleProduct(
              showEditButton: true,
              id: productController.products[index].id!,
              title: productController.products[index].title!,
              brand: productController.products[index].brand!,
              category: productController.products[index].category!,
              description: productController.products[index].description!,
              discountPercentage:
                  productController.products[index].discountPercentage!,
              firstImage: productController.products[index].images![0],
              // images: productController.product[index].images,
              rating: productController.products[index].rating!,
              price: productController.products[index].price!,
              stock: productController.products[index].stock!,
            );
          },
        );
      }),
    );
  }
}
