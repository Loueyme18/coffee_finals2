import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String username;
  const AccountPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            const Text('Edit your account info here...'),
          ],
        ),
      ),
    );
  }
}
