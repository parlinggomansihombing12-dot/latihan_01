import 'package:flutter/material.dart';
import '../utils/helpers.dart';

class BottomNav extends StatelessWidget {
  final bool showCart;
  final VoidCallback onHome;
  final VoidCallback onCart;
  final VoidCallback onAccount;

  const BottomNav({
    super.key,
    required this.showCart,
    required this.onHome,
    required this.onCart,
    required this.onAccount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _item(Icons.home, 'Beranda', onHome),
            if (showCart)
              InkWell(
                onTap: onCart,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: kOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.shopping_basket, color: Colors.white),
                    ),
                    const Text('Belanja', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            _item(Icons.account_circle, 'Akun', onAccount),
          ],
        ),
      ),
    );
  }

  Widget _item(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}