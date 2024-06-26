import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rekomendasi/pages/kelola_produk.dart';
import 'package:rekomendasi/pages/login.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement

class NavbarAdmin extends StatefulWidget {
  const NavbarAdmin({Key? key});

  @override
  State<NavbarAdmin> createState() => _NavbarAdminState();
}

class _NavbarAdminState extends State<NavbarAdmin> {
  final screens = [
    KelolaProduk(),
    Login(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final username = Get.arguments as String;
    return Scaffold(
        appBar: AppBar(
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 1) {
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
              icon: Icon(Icons.logout),
              label: '',
            ),
          ],
        ),
        body: screens[currentIndex]);
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
