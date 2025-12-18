import 'package:flutter/material.dart';

// Define your app colors here since you don't have app_colors.dart
class AppColors {
  static const Color blueberryLight = Color(0xFF2C3F70);
  static const Color strawberryLight = Color(0xFFE57373);
  static const Color buttercreamLight = Color(0xFFFFF8E7);
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> historyItems = [
      {
        'title': 'Ordered: Espresso',
        'subtitle': '₱39.00 • Dec 18, 2025',
      },
      {
        'title': 'Added to Favorites: Matcha',
        'subtitle': 'Milk Tea • Dec 17, 2025',
      },
      {
        'title': 'Paid via E-Wallet',
        'subtitle': '₱78.00 • Dec 16, 2025',
      },
      {
        'title': 'Ordered: Garlic Bread',
        'subtitle': '₱25.00 • Dec 15, 2025',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.blueberryLight,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.blueberryLight),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: historyItems.isEmpty
          ? const Center(
              child: Text(
                'No history available.',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 16,
                  color: AppColors.blueberryLight,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(24),
              itemCount: historyItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = historyItems[index];
                return HistoryItemTile(
                  title: item['title']!,
                  subtitle: item['subtitle']!,
                );
              },
            ),
    );
  }
}

class HistoryItemTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const HistoryItemTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.blueberryLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'MerriweatherSans',
              fontSize: 14,
              color: AppColors.blueberryLight,
            ),
          ),
        ],
      ),
    );
  }
}
