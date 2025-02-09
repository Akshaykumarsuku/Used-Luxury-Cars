import 'package:flutter/material.dart';
import 'package:lcars/product_detail_page.dart';

class ViewAllRecentProducts extends StatelessWidget {
  const ViewAllRecentProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Added Cars'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: recentProducts.length,
        itemBuilder: (context, index) {
          final car = recentProducts[index];
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
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car['price']!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    car['details']!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
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

final recentProducts = [
  {
    'image': 'assets/products/pro1.jpg',
    'name': 'Mercedes Benz G-Class',
    'price': '₹90.44 lakh',
    'details': 'Diesel | 48020km | 2017',
    'specs': 'V8 Engine, 577 HP, 850 Nm Torque',
  },
  {
    'image': 'assets/products/pro2.jpg',
    'name': 'RANGE ROVER SPORT',
    'price': '₹97.44 lakh',
    'details': 'Diesel | 48020km | 2018',
    'specs': 'V6 Engine, 355 HP, 700 Nm Torque',
  },
  {
    'image': 'assets/dod.jpg',
    'name': 'Dodge Challenger Hellcat',
    'price': '₹1.44 crores',
    'details': 'Diesel | 48000km | 2023',
    'specs': 'V8 Engine, 717 HP, 889 Nm Torque',
  },
  // Add more recent products as needed
];
