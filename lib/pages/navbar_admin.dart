import 'package:flutter/material.dart';
import 'package:skincare/pages/home_page_admin.dart';
import 'package:skincare/pages/login_page.dart';

class NavbarAdmin extends StatefulWidget {
  const NavbarAdmin({super.key});

  @override
  State<NavbarAdmin> createState() => _NavbarAdminState();
}

class _NavbarAdminState extends State<NavbarAdmin> {

  final screens = [
    HomePageAdmin(),
    LoginPage(), // Changed the Logout page to LoginPage
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 1) { // Check if logout icon is tapped
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