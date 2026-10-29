import 'package:flutter/material.dart';
import '../utils/helpers.dart';
import '../widgets/bottom_nav.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(
        showCart: false,
        onHome: () => context.goHome(),
        onCart: () {},
        onAccount: () {},
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('😀', style: TextStyle(fontSize: 140)),
            SizedBox(height: 16),
            Text('Parlinggoman M.Sihombing', style: TextStyle(fontSize: 16)), // ← ganti nama kamu
            Text('42325042', style: TextStyle(fontSize: 16)),  // ← ganti NIM kamu
          ],
        ),
      ),
    );
  }
}