import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'confirmation_page.dart';

class PaymentPage extends StatelessWidget {
  final double total;

  const PaymentPage({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final methods = ['E-wallet', 'Card', 'Cash'];

    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      appBar: AppBar(
        title: const Text('Payment Method',
            style: TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3F70),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Total: ₱${total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 18,
                color: Color(0xFF2C3F70),
              )),
          const SizedBox(height: 24),
          ...methods.map((method) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.strawberryLight,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmationPage(),
                      ),
                    );
                  },
                  child: Text('Pay with $method',
                      style: const TextStyle(
                        fontFamily: 'MerriweatherSans',
                        fontSize: 16,
                        color: Colors.white,
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
