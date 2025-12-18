import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../home/home_page.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle,
                  size: 80, color: AppColors.strawberryLight),
              const SizedBox(height: 24),
              const Text('Order Confirmed!',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3F70),
                  )),
              const SizedBox(height: 12),
              const Text(
                'Thank you for your order.\nYou will receive the item shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 16,
                  color: Color(0xFF2C3F70),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.strawberryLight,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const HomePage(username: 'Louiseangel'),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Continue Buying',
                    style: TextStyle(
                      fontFamily: 'MerriweatherSans',
                      fontSize: 16,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
