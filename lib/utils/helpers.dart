import 'package:flutter/material.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/category_detail_screen.dart';
import '../screens/checkout_success_screen.dart';
import '../screens/home_screen.dart';

const Color kGreen = Color(0xFF6AAB45);
const Color kOrange = Color(0xFFFF9800);
const Color kLightGreen = Color(0xFFDFF0D3);

String formatRupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp.$buf';
}

/// Navigasi antar halaman (padanan Intent di Android)
extension AppNavigation on BuildContext {
  void goHome() {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
  }

  void goCart() {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => const CartScreen()));
  }

  void goAccount() {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => const AccountScreen()));
  }

  void goCategory(String categoryId) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => CategoryDetailScreen(categoryId: categoryId)),
    );
  }

  void goCheckoutSuccess() {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (_) => const CheckoutSuccessScreen()),
    );
  }
}