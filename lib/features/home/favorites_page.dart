import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'home_page.dart'; // ✅ so it sees FavoriteItem

class FavoritesPage extends StatefulWidget {
  final List<FavoriteItem> favorites;
  final Function(FavoriteItem) onRemove;

  const FavoritesPage({
    super.key,
    required this.favorites,
    required this.onRemove,
  });

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.blueberryLight,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: widget.favorites.isEmpty
            ? const Center(
                child: Text(
                  'No favorites yet.',
                  style: TextStyle(
                    fontFamily: 'MerriweatherSans',
                    fontSize: 16,
                    color: AppColors.blueberryLight,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: widget.favorites.length,
                itemBuilder: (context, index) {
                  final item = widget.favorites[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F2F1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset(item.imagePath, height: 60),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontFamily: 'Fraunces',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blueberryLight,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.price,
                                style: const TextStyle(
                                  fontFamily: 'MerriweatherSans',
                                  fontSize: 14,
                                  color: AppColors.blueberryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          color: AppColors.strawberryLight,
                          onPressed: () {
                            widget.onRemove(item);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
