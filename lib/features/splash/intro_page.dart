import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/2am_coffee_logo.png',
                  width: 180,
                  height: 180,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Coffee worth staying up for.',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'We brew the kind of coffee that makes the late hours feel right. '
                  'Strong, honest, and always fresh.',
                  style: TextStyle(
                    fontFamily: 'MerriweatherSans',
                    fontSize: 16,
                    color: AppColors.blueberryLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.strawberryLight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'MerriweatherSans',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
