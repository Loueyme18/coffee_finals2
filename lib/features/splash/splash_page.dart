import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacementNamed('/intro');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/2am_coffee_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              '2 A.M. Coffee Co.',
              style: TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.blueberryLight,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Coffee worth staying up for.',
              style: TextStyle(
                fontFamily: 'MerriweatherSans',
                fontSize: 16,
                color: AppColors.blueberryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
