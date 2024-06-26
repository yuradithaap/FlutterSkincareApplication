import 'package:flutter/material.dart';
import 'package:rekomendasi/pages/login.dart';
import 'package:rekomendasi/pages/history.dart';
import 'package:rekomendasi/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final username = Get.arguments as String;

    final screens = [
      HomePage(username: username),
      History(username: username,),
      Login(),
    ];
    return Scaffold(
      appBar: currentIndex != 1
          ? _buildAppBar(username)
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2) {
            _logout();
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
      body: screens[currentIndex],
    );
  }

  AppBar _buildAppBar(String username) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xff925857),
      foregroundColor: const Color(0xfffde1e1),
      automaticallyImplyLeading: false,
      title: Text(
        'Hello $username!',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xfffde1e1),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
