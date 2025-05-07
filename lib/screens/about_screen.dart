import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About TrekON'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About TrekON',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'TrekON is your ultimate companion for trekking adventures. Whether you\'re a customer looking to explore new treks or a Sherpa managing your own trekking experiences, TrekON connects you with the best trekking opportunities around the world.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Developed by: TrekON Team',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}