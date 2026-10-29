import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/models.dart';
import '../utils/helpers.dart';
import 'product_shelf.dart';

class CategoryFragment extends StatelessWidget {
  final String categoryId;
  final String query;

  const CategoryFragment({
    super.key,
    required this.categoryId,
    this.query = '',
  });

  @override
  Widget build(BuildContext context) {
    final Category category =
        Repository.categories.firstWhere((c) => c.id == categoryId);
    final products = Repository.products
        .where((p) =>
            p.category == categoryId &&
            p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kLightGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(category.emoji, style: const TextStyle(fontSize: 28)),
              ),
              const SizedBox(width: 32),
              Text(category.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
        ),
        ProductShelf(products: products),
      ],
    );
  }
}