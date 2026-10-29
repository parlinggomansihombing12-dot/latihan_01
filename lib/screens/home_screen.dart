import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../utils/helpers.dart';
import '../widgets/banner_section.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_section.dart';
import '../widgets/product_shelf.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
        // Jika kolom pencarian kosong, tampilkan terlaris.
    // Jika ada isi, cari di seluruh produk.
    final products = query.isEmpty
        ? Repository.bestSellers
        : Repository.products
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    // Slot Based Layout: Scaffold dengan slot body dan bottomNavigationBar
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(
        showCart: true,
        onHome: () {}, // sudah di beranda
        onCart: () => context.goCart(),
        onAccount: () => context.goAccount(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerSection(onSearch: (v) => setState(() => query = v)),
              CategorySection(onCategoryTap: (c) => context.goCategory(c.id)),
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 6),
                child: Text('Dagangan Terlaris',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              ProductShelf(products: products),
            ],
          ),
        ),
      ),
    );
  }
}