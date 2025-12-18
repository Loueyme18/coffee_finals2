import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'favorites_page.dart';
import 'drink_detail_page.dart';
import '../cart/cart_page.dart';   // uses globalCart from cart_page.dart (must be declared there)

// Model for favorites
class FavoriteItem {
  final String name;
  final String imagePath;
  final String price;
  final String category;
  const FavoriteItem({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.category,
  });
}

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Shared favorites list (local to HomePage)
  final List<FavoriteItem> favoritesList = [];

  // Selected filter tab
  String selectedCategory = 'All Drinks';

  // Toggle favorites (add/remove)
  void toggleFavorite(FavoriteItem item) {
    final exists = favoritesList.any((i) => i.name == item.name);
    setState(() {
      if (exists) {
        favoritesList.removeWhere((i) => i.name == item.name);
      } else {
        favoritesList.add(item);
      }
    });
  }

  bool isFavorite(String name) => favoritesList.any((i) => i.name == name);

  // Build a ProductCard that also navigates to DrinkDetailPage on tap
  Widget buildCard(
    BuildContext context, {
    required String name,
    required String imagePath,
    required String price,
    required String category,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrinkDetailPage(
              name: name,
              imagePath: imagePath,
              description: description,
              price: price,
              category: category,
            ),
          ),
        );
      },
      child: ProductCard(
        name: name,
        imagePath: imagePath,
        price: price,
        isFavorite: isFavorite(name),
        onFavorite: () {
          toggleFavorite(FavoriteItem(
            name: name,
            imagePath: imagePath,
            price: price,
            category: category,
          ));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttercreamLight,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.strawberryLight,
        unselectedItemColor: AppColors.blueberryLight,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesPage(
                  favorites: favoritesList,
                  onRemove: (removedItem) {
                    setState(() {
                      favoritesList.removeWhere((i) => i.name == removedItem.name);
                    });
                  },
                ),
              ),
            );
          } else if (index == 2) {
            // Opens CartPage with globalCart (must be defined in cart_page.dart)
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(cartItems: globalCart),
              ),
            );
          } else if (index == 3) {
            Navigator.pushNamed(
              context,
              '/settings',
              arguments: {'username': widget.username, 'email': 'guest@email.com'},
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(height: 24),

              // Greeting
              Text(
                'Hello, ${widget.username}',
                style: const TextStyle(
                  fontFamily: 'Fraunces',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Welcome back!',
                style: TextStyle(
                  fontFamily: 'MerriweatherSans',
                  fontSize: 16,
                  color: AppColors.blueberryLight,
                ),
              ),
              const SizedBox(height: 24),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Coffee',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Filter Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterTab('All Drinks', selectedCategory == 'All Drinks'),
                    const SizedBox(width: 12),
                    _buildFilterTab('Hot Coffee', selectedCategory == 'Hot Coffee'),
                    const SizedBox(width: 12),
                    _buildFilterTab('Ice Coffee', selectedCategory == 'Ice Coffee'),
                    const SizedBox(width: 12),
                    _buildFilterTab('Milk Tea', selectedCategory == 'Milk Tea'),
                    const SizedBox(width: 12),
                    _buildFilterTab('Fruit Tea', selectedCategory == 'Fruit Tea'),
                    const SizedBox(width: 12),
                    _buildFilterTab('Breads', selectedCategory == 'Breads'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Hot Coffee
              if (selectedCategory == 'All Drinks' || selectedCategory == 'Hot Coffee') ...[
                const Text(
                  'Hot Coffee',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Espresso',
                        imagePath: 'assets/images/espresso.png',
                        price: '\$39.00',
                        category: 'Hot Coffee',
                        description: 'A bold and rich shot of coffee with a smooth crema.',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Choco',
                        imagePath: 'assets/images/choco.png',
                        price: '\$39.00',
                        category: 'Hot Coffee',
                        description: 'Chocolate flavored coffee with a creamy finish.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],

              // Ice Coffee
              if (selectedCategory == 'All Drinks' || selectedCategory == 'Ice Coffee') ...[
                const Text(
                  'Ice Coffee',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Vanilla',
                        imagePath: 'assets/images/vanilla.png',
                        price: '\$39.00',
                        category: 'Ice Coffee',
                        description: 'Smooth iced coffee with vanilla sweetness.',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Cappuccino',
                        imagePath: 'assets/images/cappuccino.png',
                        price: '\$39.00',
                        category: 'Ice Coffee',
                        description: 'Classic cappuccino served chilled with milk foam.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],

              // Milk Tea
              if (selectedCategory == 'All Drinks' || selectedCategory == 'Milk Tea') ...[
                const Text(
                  'Milk Tea',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Okinawa',
                        imagePath: 'assets/images/okinawa.png',
                        price: '\$39.00',
                        category: 'Milk Tea',
                        description: 'Sweet brown sugar milk tea from Okinawa.',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Matcha',
                        imagePath: 'assets/images/matcha.png',
                        price: '\$39.00',
                        category: 'Milk Tea',
                        description: 'Earthy green tea with creamy milk.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],

              // Fruit Tea
              if (selectedCategory == 'All Drinks' || selectedCategory == 'Fruit Tea') ...[
                const Text(
                  'Fruit Tea',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Blueberry',
                        imagePath: 'assets/images/blueberry.png',
                        price: '\$39.00',
                        category: 'Fruit Tea',
                        description: 'Refreshing tea infused with blueberries.',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Strawberry',
                        imagePath: 'assets/images/strawberry.png',
                        price: '\$39.00',
                        category: 'Fruit Tea',
                        description: 'Sweet strawberry tea with a fruity aroma.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],

              // Breads
              if (selectedCategory == 'All Drinks' || selectedCategory == 'Breads') ...[
                const Text(
                  'Breads',
                  style: TextStyle(
                    fontFamily: 'Fraunces',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueberryLight,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Banana Bread',
                        imagePath: 'assets/images/banana_bread.png',
                        price: '\$45.00',
                        category: 'Breads',
                        description: 'Soft, moist bread flavored with ripe bananas.',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildCard(
                        context,
                        name: 'Garlic Bread',
                        imagePath: 'assets/images/garlic_bread.png',
                        price: '\$25.00',
                        category: 'Breads',
                        description: 'Crispy bread with savory garlic butter.',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Functional filter tab
  Widget _buildFilterTab(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.strawberryLight : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blueberryLight),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'MerriweatherSans',
            fontSize: 14,
            color: isSelected ? Colors.white : AppColors.blueberryLight,
          ),
        ),
      ),
    );
  }
}

// Product card widget
class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const ProductCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.isFavorite,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: AppColors.strawberryLight,
              ),
              onPressed: onFavorite,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Image.asset(
              imagePath,
              height: 80,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Fraunces',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.blueberryLight,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
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
