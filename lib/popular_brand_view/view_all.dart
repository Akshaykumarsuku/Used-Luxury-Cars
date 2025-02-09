import 'package:flutter/material.dart';

class ViewAllBrands extends StatelessWidget {
  const ViewAllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Brands'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildBrandCard(
              context, 'assets/products/rr.jpg', 'Rolls Royce', '/rolls-royce'),
          _buildBrandCard(context, 'assets/products/pro6.jpg', 'BMW', '/bmw'),
          _buildBrandCard(context, 'assets/products/pro7.jpg', 'BYD', '/byd'),
          _buildBrandCard(
              context, 'assets/products/pro8.jpg', 'Land Rover', '/land-rover'),
          _buildBrandCard(context, 'assets/products/pro9.jpg', 'MINI', '/mini'),
        ],
      ),
    );
  }

  Widget _buildBrandCard(
      BuildContext context, String image, String name, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
