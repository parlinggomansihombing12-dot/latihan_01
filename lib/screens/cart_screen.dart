import 'package:flutter/material.dart';
import '../data/repository.dart';
import '../utils/helpers.dart';
import '../widgets/bottom_nav.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Set<int> selected;

  @override
  void initState() {
    super.initState();
    selected = CartManager.items.map((p) => p.id).toSet(); // semua terpilih
  }

  int get total => CartManager.items
      .where((p) => selected.contains(p.id))
      .fold(0, (sum, p) => sum + p.price); // qty default 1

  @override
  Widget build(BuildContext context) {
    final cart = CartManager.items;
    final allChecked = cart.isNotEmpty && selected.length == cart.length;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Keranjang Belanja', style: TextStyle(fontSize: 14)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: BottomNav(
        showCart: false,
        onHome: () => context.goHome(),
        onCart: () {},
        onAccount: () => context.goAccount(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: allChecked,
                      activeColor: kGreen,
                      onChanged: (c) => setState(() {
                        selected.clear();
                        if (c == true) selected.addAll(cart.map((p) => p.id));
                      }),
                    ),
                    const Text('Pilih Semua', style: TextStyle(fontSize: 12)),
                  ],
                ),
                TextButton(
                  onPressed: () => setState(() {
                    cart.removeWhere((p) => selected.contains(p.id));
                    selected.clear();
                  }),
                  child: const Text('Hapus',
                      style: TextStyle(color: kGreen, fontSize: 12)),
                ),
              ],
            ),
            // Lazy Layout vertikal
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, i) {
                  final p = cart[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Checkbox(
                          value: selected.contains(p.id),
                          activeColor: kGreen,
                          onChanged: (c) => setState(() {
                            if (c == true) {
                              selected.add(p.id);
                            } else {
                              selected.remove(p.id);
                            }
                          }),
                        ),
                        Text(p.emoji, style: const TextStyle(fontSize: 40)),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                            Text(p.unit, style: const TextStyle(fontSize: 11)),
                            Text(formatRupiah(p.price),
                                style: const TextStyle(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Total: ${formatRupiah(total)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kGreen,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (selected.isEmpty) return;
                    cart.removeWhere((p) => selected.contains(p.id));
                    context.goCheckoutSuccess();
                  },
                  child: const Text('Checkout', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}