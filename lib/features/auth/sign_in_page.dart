import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    final username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home', arguments: username);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your username.')),
      );
    }
  }

  void _handleSignUp() {
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),

              const Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                'Hi! Welcome back, you’ve been missed',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 16,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 32),

              const Text(
                'Username',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 14,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 14,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // add forgot password logic if needed
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontFamily: 'MerriweatherSans',
                      fontSize: 14,
                      color: AppColors.blueberryLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.strawberryLight,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'MerriweatherSans',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      fontFamily: 'MerriweatherSans',
                      fontSize: 14,
                      color: AppColors.blueberryLight,
                    ),
                  ),
                  TextButton(
                    onPressed: _handleSignUp,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'MerriweatherSans',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.strawberryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
