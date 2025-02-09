import 'package:flutter/material.dart';
import 'package:lcars/sell_car/contact_details_page.dart';

class CarAdditionalDetailPage extends StatefulWidget {
  const CarAdditionalDetailPage({super.key});

  @override
  State<CarAdditionalDetailPage> createState() =>
      _CarAdditionalDetailPageState();
}

class _CarAdditionalDetailPageState extends State<CarAdditionalDetailPage> {
  String? selectedCondition;
  String? selectedInsurance;
  String? selectedLoan;
  String? selectedOwnershipType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car basic detail'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown(
              'Car condition',
              'Select car condition',
              selectedCondition,
              ['Excellent', 'Very Good', 'Good', 'Fair'],
              (value) => setState(() => selectedCondition = value),
            ),
            _buildDropdown(
              'Car insurance type',
              'Select car insurance',
              selectedInsurance,
              ['Comprehensive', 'Third Party', 'Zero Dep', 'Expired'],
              (value) => setState(() => selectedInsurance = value),
            ),
            _buildDropdown(
              'Active loan',
              'Select active loan',
              selectedLoan,
              ['Yes', 'No'],
              (value) => setState(() => selectedLoan = value),
            ),
            _buildDropdown(
              'Ownership type',
              'Select car owner type',
              selectedOwnershipType,
              ['Individual', 'Corporate', 'Taxi'],
              (value) => setState(() => selectedOwnershipType = value),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: _validateAndProceed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String hint,
    String? value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              value ?? hint,
              style: TextStyle(
                color: value == null ? Colors.grey.shade400 : Colors.black,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              _showSelectionDialog(label, items, value, onChanged);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  void _showSelectionDialog(
    String title,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(items[index]),
                      selected: items[index] == selectedValue,
                      onTap: () {
                        onChanged(items[index]);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _validateAndProceed() {
    if (selectedCondition == null ||
        selectedInsurance == null ||
        selectedLoan == null ||
        selectedOwnershipType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ContactDetailsPage(),
      ),
    );
  }
}
