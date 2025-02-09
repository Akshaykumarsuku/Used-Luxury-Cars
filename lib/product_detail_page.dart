import 'package:flutter/material.dart';
import 'package:lcars/booking/owner_details.dart';
import 'package:lcars/booking/test_drive_booking.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> car;

  const ProductDetailPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']!),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              car['image']!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car['name']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    car['details']!,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car['price']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('All inclusive price'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '₹70,000,0/month',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text('Customize EMI Plans'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildExpandableSection('Car overview', [
                    _buildDetailRow('Registration', 'DL8C-AM9565'),
                    _buildDetailRow('Make year', 'Jan 2015'),
                    _buildDetailRow('Registered in', 'Jan 2015'),
                    _buildDetailRow('Original RC', 'Available'),
                    _buildDetailRow('Fuel', car['fuel'] ?? 'Petrol'),
                    _buildDetailRow(
                        'Transmission', car['transmission'] ?? 'Manual'),
                    _buildDetailRow('KM driven', car['kmDriven'] ?? '48020km'),
                    _buildDetailRow('Insurance validity', 'Feb 2023'),
                    _buildDetailRow('Insurance type', 'Comprehensive'),
                    _buildDetailRow('Engine Capacity', '1248CC'),
                  ]),
                  _buildExpandableSection('Interior', []),
                  _buildExpandableSection('Engine', []),
                  _buildExpandableSection('Road test', []),
                  _buildExpandableSection('Underbody', []),
                  _buildExpandableSection('Tyre', []),
                  _buildExpandableSection('Engine Transmission', []),
                  const SizedBox(height: 16),
                  const Text(
                    'FAQs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildFAQItem('Are all car in good condition?'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OwnerDetailsPage(car: car),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child:  Text('Continue Booking',style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestDriveBooking(car: car),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side:  BorderSide(color: Colors.red.shade800),
                ),
                child: const Text('Book testdrive'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildExpandableSection(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: children,
    );
  }

  Widget _buildFAQItem(String question) {
    return ExpansionTile(
      title: Text(question),
      children: const [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Yes, all cars undergo a thorough inspection and are certified to be in good condition before being listed.',
          ),
        ),
      ],
    );
  }
}
