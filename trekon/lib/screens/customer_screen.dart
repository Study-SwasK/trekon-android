import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final treks = [
      {
        'id': '1',
        'name': 'Everest Base Camp Trek',
        'location': 'Nepal',
        'distance': '130 km',
        'duration': '14 days',
        'rating': 4.8,
        'reviews': 1200,
        'price': 'INR 80,000',
        'categories': 'High Altitude, Scenic',
        'image': 'https://images.unsplash.com/photo-1518972559570-7cc03d4293bd?q=80&w=800&auto=format&fit=crop',
      },
      {
        'id': '2',
        'name': 'Annapurna Circuit',
        'location': 'Nepal',
        'distance': '160 km',
        'duration': '18 days',
        'rating': 4.7,
        'reviews': 900,
        'price': 'INR 65,000',
        'categories': 'Mountain Views, Cultural',
        'image': 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?q=80&w=800&auto=format&fit=crop',
      },
      {
        'id': '3',
        'name': 'Kilimanjaro Summit',
        'location': 'Tanzania',
        'distance': '70 km',
        'duration': '7 days',
        'rating': 4.9,
        'reviews': 1500,
        'price': 'INR 1,20,000',
        'categories': 'Summit, Adventure',
        'image': 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?q=80&w=800&auto=format&fit=crop',
      },
      {
        'id': '4',
        'name': 'Inca Trail to Machu Picchu',
        'location': 'Peru',
        'distance': '43 km',
        'duration': '4 days',
        'rating': 4.6,
        'reviews': 800,
        'price': 'INR 90,000',
        'categories': 'Historical, Scenic',
        'image': 'https://images.unsplash.com/photo-1501786223405-6d024d7c3b8d?q=80&w=800&auto=format&fit=crop',
      },
      {
        'id': '5',
        'name': 'Langtang Valley Trek',
        'location': 'Nepal',
        'distance': '65 km',
        'duration': '8 days',
        'rating': 4.5,
        'reviews': 600,
        'price': 'INR 50,000',
        'categories': 'Valley, Cultural',
        'image': 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=800&auto=format&fit=crop',
      },
      {
        'id': '6',
        'name': 'Torres del Paine Circuit',
        'location': 'Chile',
        'distance': '130 km',
        'duration': '9 days',
        'rating': 4.8,
        'reviews': 1000,
        'price': 'INR 1,00,000',
        'categories': 'Glaciers, Scenic',
        'image': 'https://images.unsplash.com/photo-1516743089983-2f4358194805?q=80&w=800&auto=format&fit=crop',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Treks'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                'TrekON',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('User Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/customer_profile');
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_6),
              title: const Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Chip(label: Text('High Altitude')),
                    SizedBox(width: 8),
                    Chip(label: Text('Scenic')),
                    SizedBox(width: 8),
                    Chip(label: Text('Cultural')),
                    SizedBox(width: 8),
                    Chip(label: Text('Adventure')),
                    SizedBox(width: 8),
                    Chip(label: Text('Historical')),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.filter_list),
                  const SizedBox(width: 16),
                  const Text(
                    'Sort by',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_drop_down),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Fast Trek',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'TOP ${treks.length} TREKS TO EXPLORE',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'FEATURED TREKS',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: treks.length,
                itemBuilder: (context, index) {
                  final trek = treks[index] as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/trek_details',
                        arguments: trek,
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            child: Image.network(
                              trek['image'] as String,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error, size: 120);
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        trek['name'] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(Icons.favorite_border, size: 20),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: Colors.green, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${trek['rating']} (${trek['reviews']}+) • ${trek['location']}, ${trek['distance']}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    trek['categories'] as String,
                                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    trek['price'] as String,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(Icons.timer, size: 16, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(
                                        trek['duration'] as String,
                                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}