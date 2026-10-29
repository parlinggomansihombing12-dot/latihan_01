import '../models/models.dart';

class Repository {
  static const List<Category> categories = [
    Category(id: 'sayur', title: 'Kategori Sayuran', label: 'Sayur', emoji: '🥬'),
    Category(id: 'buah', title: 'Kategori Buah Buahan', label: 'Buah', emoji: '🍎'),
    Category(id: 'bumbu', title: 'Kategori Bumbu Dapur', label: 'Bumbu', emoji: '🧂'),
    Category(id: 'daging', title: 'Kategori Daging', label: 'Daging', emoji: '🥩'),
    Category(id: 'telur', title: 'Kategori Telur', label: 'Telur', emoji: '🥚'),
  ];

  static const List<Product> products = [
    Product(id: 1, name: 'Kangkung', unit: '250 gram', price: 2900, category: 'sayur', emoji: '🥬'),
    Product(id: 2, name: 'Bayam', unit: '1 kg', price: 10000, category: 'sayur', emoji: '🌿'),
    Product(id: 3, name: 'Jeruk', unit: '1 kg', price: 30000, category: 'buah', emoji: '🍊'),
    Product(id: 4, name: 'Buah Naga', unit: '1 kg', price: 70000, category: 'buah', emoji: '🐉'),
    Product(id: 5, name: 'Apel', unit: '1 kg', price: 40000, category: 'buah', emoji: '🍎'),
    Product(id: 6, name: 'Bawang Merah', unit: '250 gram', price: 12000, category: 'bumbu', emoji: '🧅'),
    Product(id: 7, name: 'Cabai Merah', unit: '250 gram', price: 15000, category: 'bumbu', emoji: '🌶️'),
    Product(id: 8, name: 'Daging Sapi', unit: '1 kg', price: 89000, category: 'daging', emoji: '🥩'),
    Product(id: 9, name: 'Daging Ayam', unit: '1 kg', price: 38000, category: 'daging', emoji: '🍗'),
    Product(id: 10, name: 'Telur Ayam', unit: '10 butir', price: 25000, category: 'telur', emoji: '🥚'),
  ];

  // Dagangan terlaris di beranda
  static List<Product> get bestSellers =>
      [1, 8, 3, 5, 2].map((id) => products.firstWhere((p) => p.id == id)).toList();
}

// Keranjang dipakai bersama oleh semua halaman
class CartManager {
  static final List<Product> items = [];

  static void add(Product p) {
    // jumlah default per item = 1, jadi tidak ditambah dobel
    if (!items.any((e) => e.id == p.id)) items.add(p);
  }
}