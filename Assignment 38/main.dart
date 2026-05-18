import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/menu_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bKash UI Assignment',
      theme: ThemeData(
        primaryColor: const Color(0xFFE2125B),
        useMaterial3: true,
      ),
      home: const HomeScreenPlaceholder(),
    );
  }
}

// আপনার হোম স্ক্রিনটি তৈরি করার আগ পর্যন্ত মেনু ও প্রোফাইল টেস্ট করার জন্য এই প্লেসহোল্ডার স্ক্রিনটি ব্যবহার করুন
class HomeScreenPlaceholder extends StatelessWidget {
  const HomeScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bKash Home (Demo)'),
        backgroundColor: const Color(0xFFE2125B),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE2125B)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuScreen()));
              },
              child: const Text('Open Menu Screen', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE2125B)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
              child: const Text('Open Profile Screen', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}