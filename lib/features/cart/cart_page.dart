import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../payment/payment_page.dart'; // ✅ adjust path if payment_page.dart is in a different folder


class CartItem {
  final String name;
  final String imagePath;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice =>
      widget.cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  void updateQuantity(int index, int change) {
    setState(() {
      final item = widget.cartItems[index];
      item.quantity = (item.quantity + change).clamp(1, 99);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 16,
                  color: Color(0xFF2C3F70),
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        leading: Image.asset(item.imagePath, height: 40),
                        title: Text(
                          item.name,
                          style: const TextStyle(
                            fontFamily: 'Fraunces',
                            fontSize: 16,
                            color: Color(0xFF2C3F70),
                          ),
                        ),
                        subtitle: Text(
                          '₱${item.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'MerriweatherSans',
                            fontSize: 14,
                            color: Color(0xFF2C3F70),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => updateQuantity(index, -1),
                            ),
                            Text(
                              item.quantity.toString(),
                              style: const TextStyle(
                                fontFamily: 'Fraunces',
                                fontSize: 16,
                                color: Color(0xFF2C3F70),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => updateQuantity(index, 1),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ₱${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontFamily: 'Fraunces',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3F70),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.strawberryLight,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PaymentPage(total: totalPrice),
                            ),
                          );
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontFamily: 'MerriweatherSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
