import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final String username;
  final String email;

  const SettingsPage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // 🧑 Account Section
          const Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(username),
            subtitle: Text(email),
            trailing: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/account', arguments: username);
              },
              child: const Text('Edit Account'),
            ),
          ),
          const Divider(),

          // 📱 Device Section
          const Text('Device', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('Notifications'),
          ),
          SwitchListTile(
            value: true,
            onChanged: (val) {},
            title: const Text('Dark Mode'),
          ),
          const Divider(),

          // 📜 History Section
          const Text('History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('View History'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          const Divider(),

          // 💳 Payment Section
          const Text('Payment Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Add E-Wallet'),
            trailing: const Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, '/wallet');
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Add Card Number'),
            trailing: const Icon(Icons.add),
            onTap: () {
              Navigator.pushNamed(context, '/card');
            },
          ),
          const Divider(),

          // 🚪 Log Out
          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signin');
              },
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
