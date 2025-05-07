import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SherpaScreen extends StatefulWidget {
  const SherpaScreen({super.key});

  @override
  State<SherpaScreen> createState() => _SherpaScreenState();
}

class _SherpaScreenState extends State<SherpaScreen> {
  final List<Map<String, dynamic>> _treks = [
    {
      'name': 'Manaslu Circuit',
      'location': 'Nepal',
      'distance': '177 km',
      'duration': '14 days',
      'rating': 4.7,
      'reviews': 500,
      'price': 'INR 70,000',
      'categories': 'Remote, Scenic',
      'image': 'https://images.unsplash.com/photo-1592229505568-3e2ebfc4a5f5?q=80&w=800&auto=format&fit=crop',
      'details': 'A challenging trek around the Manaslu massif.',
      'description': 'This trek takes you through remote villages and stunning Himalayan landscapes.',
      'members': '10',
      'difficulty': 'Hard',
    },
    {
      'name': 'Gokyo Lakes Trek',
      'location': 'Nepal',
      'distance': '90 km',
      'duration': '12 days',
      'rating': 4.6,
      'reviews': 400,
      'price': 'INR 60,000',
      'categories': 'Lakes, Scenic',
      'image': 'https://images.unsplash.com/photo-1592229506151-84594017429e?q=80&w=800&auto=format&fit=crop',
      'details': 'Explore the pristine Gokyo Lakes.',
      'description': 'A scenic trek with views of Everest and turquoise lakes.',
      'members': '8',
      'difficulty': 'Mediocre',
    },
    {
      'name': 'Mount Kenya Climb',
      'location': 'Kenya',
      'distance': '50 km',
      'duration': '5 days',
      'rating': 4.8,
      'reviews': 300,
      'price': 'INR 90,000',
      'categories': 'Summit, Adventure',
      'image': 'https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?q=80&w=800&auto=format&fit=crop',
      'details': 'Climb the second-highest peak in Africa.',
      'description': 'A thrilling ascent with diverse flora and fauna.',
      'members': '6',
      'difficulty': 'Hard',
    },
    {
      'name': 'Cordillera Huayhuash',
      'location': 'Peru',
      'distance': '120 km',
      'duration': '10 days',
      'rating': 4.9,
      'reviews': 200,
      'price': 'INR 85,000',
      'categories': 'High Altitude, Scenic',
      'image': 'https://images.unsplash.com/photo-1501786223405-6d024d7c3b8d?q=80&w=800&auto=format&fit=crop',
      'details': 'A remote trek in the Andes.',
      'description': 'Experience rugged mountains and glacial lakes.',
      'members': '12',
      'difficulty': 'Hard',
    },
    {
      'name': 'Poon Hill Trek',
      'location': 'Nepal',
      'distance': '40 km',
      'duration': '5 days',
      'rating': 4.5,
      'reviews': 700,
      'price': 'INR 30,000',
      'categories': 'Short, Scenic',
      'image': 'https://images.unsplash.com/photo-1551632811-561732d1e306?q=80&w=800&auto=format&fit=crop',
      'details': 'A short trek with panoramic views.',
      'description': 'Ideal for beginners with stunning sunrise views.',
      'members': '15',
      'difficulty': 'Easy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Treks'),
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
                Navigator.pushNamed(context, '/sherpa_profile');
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
              Text(
                'YOUR ${_treks.length} TREKS',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'MANAGED TREKS',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _treks.length,
                itemBuilder: (context, index) {
                  final trek = _treks[index];
                  return Card(
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
                                Text(
                                  trek['name'] as String,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
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
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_trek').then((newTrek) {
                    if (newTrek != null) {
                      setState(() {
                        _treks.add(newTrek as Map<String, dynamic>);
                      });
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Create New Trek',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}