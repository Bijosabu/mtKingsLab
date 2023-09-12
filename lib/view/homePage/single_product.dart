import 'package:flutter/material.dart';
import 'package:mtkingslab/view/productPage/product_page.dart';
import 'package:get/get.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String firstImage;
  final String title;
  final String description;

  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final bool showEditButton;
  // final List<String> images;
  const SingleProduct({
    super.key,
    required this.firstImage,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.id,
    required this.showEditButton,
    // required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Image.network(
            firstImage,
            height: 300,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              if (showEditButton)
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(ProductPage(id: id));
                        },
                        child: const Text('Edit'))
                  ],
                ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                price.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                discountPercentage.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Stock: $stock Available",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Brand:$brand",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 6),
              Text(
                "Category: $category",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
