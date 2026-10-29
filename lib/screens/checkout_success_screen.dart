import 'package:flutter/material.dart';
import '../utils/helpers.dart';
import '../widgets/bottom_nav.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(
        showCart: false,
        onHome: () => context.goHome(),
        onCart: () {},
        onAccount: () => context.goAccount(),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('😀', style: TextStyle(fontSize: 140)),
            SizedBox(height: 16),
            Text(
              'Terimakasih\nsudah membeli',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}