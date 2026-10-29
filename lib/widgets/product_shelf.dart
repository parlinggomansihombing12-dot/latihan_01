import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/models.dart';
import '../utils/helpers.dart';
import 'product_card.dart';

class ProductShelf extends StatelessWidget {
  final List<Product> products;

  const ProductShelf({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
        return Container(
      width: double.infinity,
      height: 230,   // ← sebelumnya 200
      color: kGreen,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ProductCard(
              product: p,
              onBuy: () {
                CartManager.add(p);
                context.goCart();
              },
            ),
          );
        },
      ),
    );
  }
}