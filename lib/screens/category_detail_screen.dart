import 'package:flutter/material.dart';
import '../utils/helpers.dart';
import '../widgets/banner_section.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_fragment.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String categoryId;

  const CategoryDetailScreen({super.key, required this.categoryId});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(
        showCart: true,
        onHome: () => context.goHome(),
        onCart: () => context.goCart(),
        onAccount: () => context.goAccount(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerSection(onSearch: (v) => setState(() => query = v)),
              // "Fragment" ditempel di sini
              CategoryFragment(categoryId: widget.categoryId, query: query),
            ],
          ),
        ),
      ),
    );
  }
}