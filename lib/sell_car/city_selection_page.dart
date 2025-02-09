import 'package:flutter/material.dart';

class CitySelectionPage extends StatelessWidget {
  const CitySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildSearchBar(),
          _buildPopularCities(),
          _buildAllCities(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search city',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularCities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Popular Cities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'Alappuzha',
            'Kollam',
            'Ernakulam',
            'Trivandrum',
            'Calicut',
            'Kottayam',
          ].map((city) => _buildCityChip(city)).toList(),
        ),
      ],
    );
  }

  Widget _buildAllCities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'All Cities',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allCities.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allCities[index]),
              onTap: () {
                Navigator.pop(context, allCities[index]);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildCityChip(String city) {
    return Chip(
      label: Text(city),
      backgroundColor: Colors.grey.shade200,
    );
  }
}

final allCities = [
  'Mannar',
  'Edappally',
  'Thrissur',
  'Thiruvala',
  'Mavelikara',
  'Chengannur',
  'Changanassery',
  'Kadavanthra',
  'Irinjalakuda',
  'Nilambur',
  // Add more cities as needed
];
