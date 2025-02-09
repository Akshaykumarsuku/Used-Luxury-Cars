import 'package:flutter/material.dart';
import 'package:lcars/sell_car/car_additional_detail_page.dart';

class CarBasicDetailPage extends StatefulWidget {
  const CarBasicDetailPage({super.key});

  @override
  State<CarBasicDetailPage> createState() => _CarBasicDetailPageState();
}

class _CarBasicDetailPageState extends State<CarBasicDetailPage> {
  final _registrationController = TextEditingController();
  final _kilometersController = TextEditingController();
  String? selectedOwner;
  String? selectedYear;
  String? selectedFuelType;
  String? selectedTransmission;
  String? selectedState;

  @override
  void dispose() {
    _registrationController.dispose();
    _kilometersController.dispose();
    super.dispose();
  }

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
            _buildTextField(
              'Registration Number',
              'Ex - KL30D2213',
              _registrationController,
            ),
            _buildTextField(
              'Kilometers driven',
              'Ex - 30,000kms',
              _kilometersController,
            ),
            _buildDropdown(
              'Number of owner',
              'Select number of owner',
              selectedOwner,
              ['1st', '2nd', '3rd', '4th', 'More than 4'],
              (value) => setState(() => selectedOwner = value),
            ),
            _buildDropdown(
              'Car manufacturing year',
              'Select car manufacturing year',
              selectedYear,
              List.generate(30, (index) => (2024 - index).toString()),
              (value) => setState(() => selectedYear = value),
            ),
            _buildDropdown(
              'Fuel type',
              'Select car fuel type',
              selectedFuelType,
              ['Petrol', 'Diesel', 'Electric', 'CNG', 'Hybrid'],
              (value) => setState(() => selectedFuelType = value),
            ),
            _buildDropdown(
              'Transmission type',
              'Select car transmission type',
              selectedTransmission,
              ['Manual', 'Automatic'],
              (value) => setState(() => selectedTransmission = value),
            ),
            _buildDropdown(
              'State',
              'Select car registration state',
              selectedState,
              ['Kerala', 'Tamil Nadu', 'Karnataka', 'Maharashtra', 'Delhi'],
              (value) => setState(() => selectedState = value),
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

  Widget _buildTextField(
    String label,
    String hint,
    TextEditingController controller,
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
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
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
    if (_registrationController.text.isEmpty ||
        _kilometersController.text.isEmpty ||
        selectedOwner == null ||
        selectedYear == null ||
        selectedFuelType == null ||
        selectedTransmission == null ||
        selectedState == null) {
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
        builder: (context) => const CarAdditionalDetailPage(),
      ),
    );
  }
}
