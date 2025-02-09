import 'package:flutter/material.dart';
import 'package:lcars/booking/checkout_page.dart';

class OwnerDetailsPage extends StatelessWidget {
  final Map<String, String> car;
  const OwnerDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Owner detail'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(Icons.person_outline, 'Enter your name'),
            const SizedBox(height: 16),
            _buildTextField(Icons.email_outlined, 'Enter your email id'),
            const SizedBox(height: 16),
            _buildTextField(Icons.phone_outlined, 'Enter your mobile number'),
            const SizedBox(height: 16),
            _buildTextField(Icons.location_on_outlined, 'Enter your address'),
            const SizedBox(height: 16),
            _buildTextField(Icons.location_city_outlined, 'Enter your city'),
            const SizedBox(height: 16),
            _buildTextField(Icons.pin_drop_outlined, 'Enter your pincode'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(car: car),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade800,
                minimumSize: const Size(double.infinity, 48),
              ),
              child:  Text('Continue',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
