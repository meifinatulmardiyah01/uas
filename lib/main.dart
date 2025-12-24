import 'package:flutter/material.dart';
import 'package:tugas_uas/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App', // Updated title
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Lexend', // Add google_fonts or assets if needed
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF135BEC)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
