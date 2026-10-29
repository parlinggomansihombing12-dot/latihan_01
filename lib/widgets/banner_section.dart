import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const BannerSection({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      color: const Color(0xFFF7F7F7),
      child: Stack(
        children: [
          // Kolom pencarian
          Positioned(
            top: 8,
            left: 8,
            right: 120,
            child: SizedBox(
              height: 40,
              child: TextField(
                onChanged: onSearch,
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'Cari produk segar di sini...',
                  hintStyle: const TextStyle(fontSize: 11),
                  prefixIcon: const Icon(Icons.search, size: 18),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ),
          // Sapaan
          const Positioned(
            left: 16,
            top: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat Datang',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('Mau belanja apa?', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          // Gambar banner
          const Positioned(
            right: 8,
            bottom: 12,
            child: Text('🛍️🥦🍎', style: TextStyle(fontSize: 44)),
          ),
        ],
      ),
    );
  }
}