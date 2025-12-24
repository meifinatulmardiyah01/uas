import 'package:flutter/material.dart';
import 'package:tugas_uas/home_page.dart';
import 'package:tugas_uas/explore_page.dart';
import 'package:tugas_uas/my_courses_page.dart';
import 'package:tugas_uas/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        onSeeAll: () => _onItemTapped(1),
        onSearchTap: () => _onItemTapped(1), // Link search to Explore
      ),
      const ExplorePage(),
      const MyCoursesPage(),
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Colors from design
    final primaryColor = const Color(0xFF135BEC);
    final surfaceColor = Colors.white;
    final textMutedColor = const Color(0xFF64748B);

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: surfaceColor,
          border: Border(top: BorderSide(color: Colors.grey[200]!)),
        ),
        child: BottomNavigationBar(
          backgroundColor: surfaceColor,
          elevation: 0,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: textMutedColor,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Jelajahi'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Kursusku'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
