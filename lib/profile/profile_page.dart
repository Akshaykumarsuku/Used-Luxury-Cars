import 'package:flutter/material.dart';
import 'package:lcars/sell_car/sell_car_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

  Widget _buildProfileOption({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/person.jpg'),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Akshay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+91 8157856465',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Profile Options
            _buildProfileOption(
              title: 'Edit profile',
              icon: Icons.person_outline,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'My booking',
              icon: Icons.calendar_today_outlined,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'Shop locations',
              icon: Icons.location_on_outlined,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'Language',
              icon: Icons.language,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'Favourite',
              icon: Icons.favorite_border,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'Help',
              icon: Icons.help_outline,
              onTap: () {},
            ),
            _buildProfileOption(
              title: 'Terms and condition',
              icon: Icons.info_outline,
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            // Buy car (Home)
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            // Sell car
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SellCarPage(),
              ),
            );
          }
          // Don't need to handle index 2 (Account) as we're already there
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Buy car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.red.shade800,
      ),
    );
  }
}
