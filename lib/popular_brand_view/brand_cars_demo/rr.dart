import 'package:flutter/material.dart';
import 'package:lcars/product_detail_page.dart';

class RollsRoycePage extends StatefulWidget {
  const RollsRoycePage({super.key});

  @override
  State<RollsRoycePage> createState() => _RollsRoycePageState();
}

class _RollsRoycePageState extends State<RollsRoycePage> {
  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(rollsRoyceProducts);
  }

  void _showSortDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort by',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSortOption('Relevance'),
            _buildSortOption('Recently added'),
            _buildSortOption('Price - Low to high'),
            _buildSortOption('Price - High to low'),
            _buildSortOption('Km driven - Low to high'),
            _buildSortOption('Km driven - High to low'),
            _buildSortOption('Year - New to old'),
          ],
        ),
      ),
    );
  }

  Widget _buildSortOption(String title) {
    return ListTile(
      title: Text(title),
      trailing: Radio<String>(
        value: title,
        groupValue: 'Relevance', // Replace with actual selected value
        onChanged: (value) {
          Navigator.pop(context);
          // Implement sorting logic here
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rolls Royce'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: _showSortDialog,
            child: const Text(
              'Sort by ↓',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final car = filteredProducts[index];
          return _buildCarCard(context, car);
        },
      ),
    );
  }

  Widget _buildCarCard(BuildContext context, Map<String, String> car) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(car: car),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                car['image']!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    car['price']!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    car['details']!,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final rollsRoyceProducts = [
  {
    'image': 'assets/cars/rolls.jpg',
    'name': 'Rolls-Royce Phantom',
    'price': '₹9.50 Crores',
    'details': 'Petrol | 0 km | 2024',
    'specs': 'V12 Engine, 563 HP, 900 Nm Torque',
  },
  // Add more products...
];
