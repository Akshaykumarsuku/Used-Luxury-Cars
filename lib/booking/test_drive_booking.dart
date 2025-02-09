import 'package:flutter/material.dart';
import 'package:lcars/booking/booking_success_page.dart';

class TestDriveBooking extends StatefulWidget {
  final Map<String, String> car;
  const TestDriveBooking({super.key, required this.car});

  @override
  State<TestDriveBooking> createState() => _TestDriveBookingState();
}Initialized empty Git repository in D:/Flutter/lcars/.git/


class _TestDriveBookingState extends State<TestDriveBooking> {
  String selectedLocation = 'Shop Location';
  String? selectedDate;
  String? selectedTime;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Drive'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select location',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildLocationButton(
                    'Shop Location', selectedLocation == 'Shop Location'),
                const SizedBox(width: 16),
                _buildLocationButton(
                    'Your location', selectedLocation == 'Your location'),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              selectedLocation == 'Shop Location'
                  ? 'Shop location'
                  : 'Your location',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (selectedLocation == 'Shop Location')
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Gandhi Square 12,'),
                          Text('Kadavanthra,Ernakulam'),
                        ],
                      ),
                    ),
                    const Icon(Icons.location_on_outlined),
                  ],
                ),
              )
            else
              Column(
                children: [
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Enter your address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      prefixIcon: const Icon(Icons.location_on_outlined),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      hintText: 'Enter your city',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      prefixIcon: const Icon(Icons.location_city),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _pincodeController,
                    decoration: InputDecoration(
                      hintText: 'Enter your pincode',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      prefixIcon: const Icon(Icons.pin_drop),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            const SizedBox(height: 24),
            const Text(
              'Select date',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildDateButton('18 Aug', 'Today'),
                _buildDateButton('19 Aug', 'Tomorrow', isSelected: true),
                _buildDateButton('20 Aug', 'Monday'),
                _buildDateButton('21 Aug', 'Tuesday'),
                _buildDateButton('22 Aug', 'Wednesday'),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Select time',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTimeButton('10:00am-12:00 pm', isSelected: true),
                _buildTimeButton('12:00pm-1:00 pm'),
                _buildTimeButton('2:00pm-3:00 pm'),
                _buildTimeButton('4:00am-6:00 pm'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            // Validate location fields if "Your location" is selected
            if (selectedLocation == 'Your location' &&
                (_addressController.text.isEmpty ||
                    _cityController.text.isEmpty ||
                    _pincodeController.text.isEmpty)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill in all location fields'),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingSuccessPage(
                  car: widget.car,
                  isTestDrive: true,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child:  Text('Confirm',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  Widget _buildLocationButton(String title, bool isSelected) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedLocation = title;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.red.shade800 : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.black,
          elevation: 0,
          side:
              BorderSide(color: isSelected ? Colors.red.shade800 : Colors.grey.shade300),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildDateButton(String date, String day, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedDate = date;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red.shade800 : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        side: BorderSide(color: isSelected ? Colors.red.shade800 : Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(date),
          Text(day, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTimeButton(String time, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTime = time;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red.shade800 : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        side: BorderSide(color: isSelected ? Colors.red.shade800 : Colors.grey.shade300),
      ),
      child: Text(time),
    );
  }
}
