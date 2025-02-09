import 'package:flutter/material.dart';
import 'package:lcars/booking/booking_success_page.dart';

class CheckoutPage extends StatefulWidget {
  final Map<String, String> car;
  const CheckoutPage({super.key, required this.car});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? selectedPayment;
  bool showPaymentMethods = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCarCard(),
                const SizedBox(height: 16),
                _buildCheckbox('Apply for EMI'),
                const SizedBox(height: 16),
                _buildSummary(),
                const SizedBox(height: 24),
                _buildNextSteps(),
              ],
            ),
          ),
          if (showPaymentMethods) _buildPaymentMethodsSheet(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            if (showPaymentMethods) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingSuccessPage(
                    car: widget.car,
                    isTestDrive: false,
                  ),
                ),
              );
            } else {
              setState(() {
                showPaymentMethods = true;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800,
            minimumSize: const Size(double.infinity, 48),
          ),
          child: Text(showPaymentMethods ? 'Pay now' : 'Proceed to pay',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  Widget _buildCarCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            widget.car['image']!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.car['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.car['details']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String title) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (value) {},
          activeColor: Colors.red.shade800,
        ),
        Text(title),
      ],
    );
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Summary',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Purchase amount', '₹5.44 lakh'),
        _buildSummaryRow('Booking amount', '₹1000'),
        _buildSummaryRow('Balance amount', '₹5.43 lakh'),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildNextSteps() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What happens next',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildStepCard(Icons.payment, '1. Make Booking'),
            _buildStepCard(Icons.description, '2. Complete paperwork'),
            _buildStepCard(
                Icons.account_balance_wallet, '3. Pay balance amount'),
            _buildStepCard(Icons.directions_car, '4. Get home delivery'),
          ],
        ),
      ],
    );
  }

  Widget _buildStepCard(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.red.shade800),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodsSheet() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select payment method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption('Creditcard'),
            _buildPaymentOption('UPI'),
            _buildPaymentOption('Paytm'),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method) {
    return RadioListTile(
      title: Text(method),
      value: method,
      groupValue: selectedPayment,
      onChanged: (value) {
        setState(() {
          selectedPayment = value as String;
        });
      },
      activeColor: Colors.red.shade800,
    );
  }
}
