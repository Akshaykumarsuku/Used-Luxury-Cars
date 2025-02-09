import 'package:flutter/material.dart';
import 'package:lcars/popular_brand_view/view_all.dart';
import 'package:lcars/popular_brand_view/brand_cars_demo/rr.dart'; // Import the RollsRoycePage
import 'package:lcars/recently_added/view_all_recent.dart';
import 'package:lcars/product_detail_page.dart';
import 'package:lcars/sell_car/sell_car_page.dart';
import 'package:lcars/profile/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Used Cars',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section with background image and search
            Container(
              height: 220,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/products/pro4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 8),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        hintText: 'Search your car',
                        hintStyle: const TextStyle(color: Colors.white),
                        suffixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Recently added cars section
            _buildSection(
              context: context,
              title: 'Recently added car',
              viewAll: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildCarCard(
                      context: context,
                      image: 'assets/products/pro1.jpg',
                      name: 'Mercedes Benz G-Class',
                      price: '₹90.44 lakh',
                      details: 'Diesel | 48020km | 2017',
                    ),
                    _buildCarCard(
                      context: context,
                      image: 'assets/products/pro2.jpg',
                      name: 'RANGE ROVER SPORT',
                      price: '₹97.44 lakh',
                      details: 'Diesel | 48020km | 2018',
                    ),
                    _buildCarCard(
                      context: context,
                      image: 'assets/dod.jpg',
                      name: 'Dodge Challenger Hellcat',
                      price: '₹1.44 crores',
                      details: 'Diesel | 48000km | 2023',
                    ),
                  ],
                ),
              ),
            ),

            // Popular brands section
            _buildSection(
              context: context,
              title: 'Most popular brand',
              viewAll: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildBrandLogo(context, 'assets/products/rr.jpg'),
                    _buildBrandLogo(context, 'assets/products/pro6.jpg'),
                    _buildBrandLogo(context, 'assets/products/pro7.jpg'),
                    _buildBrandLogo(context, 'assets/products/pro8.jpg'),
                    _buildBrandLogo(context, 'assets/products/pro9.jpg'),
                  ],
                ),
              ),
            ),

            // Services section
            _buildSection(
              context: context,
              title: 'Services',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _buildServiceCard(
                      icon: Icons.attach_money,
                      title: 'Easy Financing',
                      color: Colors.black,
                      iconColor: Colors.white,
                    ),
                    _buildServiceCard(
                      icon: Icons.local_shipping,
                      title: 'Doorstep delivery',
                      color: Colors.black,
                      iconColor: Colors.white,
                    ),
                    _buildServiceCard(
                      icon: Icons.refresh,
                      title: '7 day return',
                      color: Colors.black,
                      iconColor: Colors.white,
                    ),
                    _buildServiceCard(
                      icon: Icons.verified,
                      title: '1 Year warranty',
                      color: Colors.black,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),
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
          if (index == 1) {
            // Sell car
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SellCarPage(),
              ),
            );
          } else if (index == 2) {
            // Account
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
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

  Widget _buildSection({
    required BuildContext context,
    required String title,
    bool viewAll = false,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (viewAll)
                TextButton(
                  onPressed: () {
                    if (title == 'Most popular brand') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewAllBrands(),
                        ),
                      );
                    } else if (title == 'Recently added car') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewAllRecentProducts(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildCarCard({
    required BuildContext context,
    required String image,
    required String name,
    required String price,
    required String details,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              car: {
                'image': image,
                'name': name,
                'price': price,
                'details': details,
                'specs':
                    'Engine specifications will be displayed here', // Add appropriate specs
              },
            ),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                image,
                height: 120,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(color: Colors.red),
                  ),
                  Text(
                    details,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandLogo(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        String route = '';
        if (image.contains('rr')) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const RollsRoycePage()), // Navigate directly to RollsRoycePage
          );
        } else if (image.contains('pro6')) {
          route = '/bmw';
        } else if (image.contains('pro7')) {
          route = '/byd';
        } else if (image.contains('pro8')) {
          route = '/land-rover';
        } else if (image.contains('pro9')) {
          route = '/mini';
        }

        if (route.isNotEmpty) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(right: 16),
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

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: iconColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
