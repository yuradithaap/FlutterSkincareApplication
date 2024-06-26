import 'package:flutter/material.dart';
import 'package:skincare/pages/login_page.dart';
import 'package:skincare/pages/history_page.dart';
import 'package:skincare/pages/home_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _Navbar();
}

class _Navbar extends State<Navbar> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    HistoryPage(),
    LoginPage(), // Changed the Logout page to LoginPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) { // Check if logout icon is tapped
            _logout(); // Perform logout action
          } else {
            setState(() => currentIndex = index);
          }
        },
        backgroundColor: const Color(0xff925857),
        fixedColor: const Color(0xfffde1e1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: '',
          ),
        ],
      ),
      body: screens[currentIndex]
    );
  }

  void _logout() {
    // Perform logout actions here, such as clearing user sessions, etc.
    // For now, you can simply navigate to the login page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
