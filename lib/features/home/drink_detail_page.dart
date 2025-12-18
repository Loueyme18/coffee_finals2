import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../cart/cart_page.dart';

// Temporary shared cart storage (replace with Provider/Bloc later)
List<CartItem> globalCart = [];

class DrinkDetailPage extends StatefulWidget {
  final String name;
  final String imagePath;
  final String description;
  final String price;    // e.g., "₱39.00" or "$39.00"
  final String category; // e.g., "Hot Coffee", "Milk Tea", "Fruit Tea", "Breads"

  const DrinkDetailPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
    required this.category,
  });

  @override
  State<DrinkDetailPage> createState() => _DrinkDetailPageState();
}

class _DrinkDetailPageState extends State<DrinkDetailPage> {
  late final bool hasAddOns;

  // Simple layout (Hot Coffee & Breads)
  int quantity = 1;

  // Add-ons layout (Ice Coffee, Milk Tea, Fruit Tea)
  String selectedSize = 'Grande';
  final Map<String, double> sizePrices = {
    'Grande': 39.0,
    'Venti': 49.0,
  };
  final List<String> addOns = ['Pearl', 'Pudding', 'Nata de coco', 'Whipped Cream'];
  final Set<String> selectedAddOns = {};

  double get totalPrice {
    final base = sizePrices[selectedSize]!;
    final addOnCost = selectedAddOns.length * 10;
    return base + addOnCost;
  }

  double get parsedBasePrice {
    final cleaned = widget.price
        .replaceAll('₱', '')
        .replaceAll('\$', '')
        .replaceAll(',', '')
        .trim();
    return double.tryParse(cleaned) ?? 0.0;
  }

  @override
  void initState() {
    super.initState();
    hasAddOns = ['Ice Coffee', 'Milk Tea', 'Fruit Tea'].contains(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF2C3F70)),
        title: Text(
          '${widget.category} details',
          style: const TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: hasAddOns ? _buildAddOnsLayout() : _buildSimpleLayout(),
      ),
    );
  }

  // Layout for Hot Coffee & Breads
  Widget _buildSimpleLayout() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          widget.name,
          style: const TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(widget.imagePath, height: 120),
        const SizedBox(height: 24),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'MerriweatherSans',
            fontSize: 16,
            color: Color(0xFF2C3F70),
          ),
        ),
        const Spacer(),

        // Quantity selector
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove, color: Color(0xFF2C3F70)),
              onPressed: () {
                if (quantity > 1) setState(() => quantity--);
              },
            ),
            Text(
              quantity.toString().padLeft(2, '0'),
              style: const TextStyle(
                fontFamily: 'Fraunces',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3F70),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Color(0xFF2C3F70)),
              onPressed: () => setState(() => quantity++),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Add to Cart button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.strawberryLight,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              globalCart.add(CartItem(
                name: widget.name,
                imagePath: widget.imagePath,
                price: parsedBasePrice,
                quantity: quantity,
              ));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: globalCart),
                ),
              );
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(
                fontFamily: 'MerriweatherSans',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // Layout for Ice Coffee, Milk Tea, Fruit Tea
  Widget _buildAddOnsLayout() {
    return ListView(
      children: [
        const SizedBox(height: 24),
        Text(
          widget.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        const SizedBox(height: 16),
        Center(child: Image.asset(widget.imagePath, height: 120)),
        const SizedBox(height: 24),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'MerriweatherSans',
            fontSize: 16,
            color: Color(0xFF2C3F70),
          ),
        ),
        const SizedBox(height: 32),

        // Size options
        const Text(
          'Size',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: sizePrices.entries.map((entry) {
            final isSelected = selectedSize == entry.key;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => selectedSize = entry.key),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.strawberryLight : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF2C3F70)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        entry.key,
                        style: TextStyle(
                          fontFamily: 'MerriweatherSans',
                          fontSize: 14,
                          color: isSelected ? Colors.white : const Color(0xFF2C3F70),
                        ),
                      ),
                      Text(
                        '₱${entry.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontFamily: 'MerriweatherSans',
                          fontSize: 14,
                          color: isSelected ? Colors.white : const Color(0xFF2C3F70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),

        // Add-ons chips
        const Text(
          'Add-ons (+₱10)',
          style: TextStyle(
            fontFamily: 'Fraunces',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3F70),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: addOns.map((addOn) {
            final isSelected = selectedAddOns.contains(addOn);
            return ChoiceChip(
              label: Text(addOn),
              selected: isSelected,
              selectedColor: AppColors.strawberryLight,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                fontFamily: 'MerriweatherSans',
                fontSize: 14,
                color: isSelected ? Colors.white : const Color(0xFF2C3F70),
              ),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedAddOns.add(addOn);
                  } else {
                    selectedAddOns.remove(addOn);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 32),

        // Add to Cart button with dynamic price
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.strawberryLight,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              final title = selectedAddOns.isEmpty
                  ? '${widget.name} • $selectedSize'
                  : '${widget.name} • $selectedSize • ${selectedAddOns.join(', ')}';

              globalCart.add(CartItem(
                name: title,
                imagePath: widget.imagePath,
                price: totalPrice,
                quantity: 1,
              ));

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: globalCart),
                ),
              );
            },
            child: Text(
              'Add to Cart — ₱${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontFamily: 'MerriweatherSans',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
