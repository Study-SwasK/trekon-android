import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/customer_screen.dart';
import 'screens/trek_details_screen.dart';
import 'screens/sherpa_screen.dart';
import 'screens/create_trek_screen.dart';
import 'screens/about_screen.dart';
import 'screens/customer_profile_screen.dart';
import 'screens/sherpa_profile_screen.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'TrekON',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2E7D32),
              secondary: Color(0xFF66BB6A),
            ),
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF66BB6A),
              secondary: Color(0xFF2E7D32),
            ),
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/customer': (context) => const CustomerScreen(),
            '/trek_details': (context) => const TrekDetailsScreen(),
            '/sherpa': (context) => const SherpaScreen(),
            '/create_trek': (context) => const CreateTrekScreen(),
            '/about': (context) => const AboutScreen(),
            '/customer_profile': (context) => const CustomerProfileScreen(),
            '/sherpa_profile': (context) => const SherpaProfileScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}