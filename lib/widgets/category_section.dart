import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../models/models.dart';
import '../utils/helpers.dart';

class CategorySection extends StatelessWidget {
  final ValueChanged<Category> onCategoryTap;

  const CategorySection({super.key, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: Repository.categories.map((c) {
          return InkWell(
            onTap: () => onCategoryTap(c),
            child: Column(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kLightGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(c.emoji, style: const TextStyle(fontSize: 30)),
                ),
                const SizedBox(height: 2),
                Text(c.label, style: const TextStyle(fontSize: 11)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}