class Category {
  final String id;
  final String title;
  final String label;
  final String emoji;

  const Category({
    required this.id,
    required this.title,
    required this.label,
    required this.emoji,
  });
}

class Product {
  final int id;
  final String name;
  final String unit;
  final int price;
  final String category;
  final String emoji;

  const Product({
    required this.id,
    required this.name,
    required this.unit,
    required this.price,
    required this.category,
    required this.emoji,
  });
}