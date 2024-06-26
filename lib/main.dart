import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rekomendasi/pages/login.dart';
import 'package:rekomendasi/pages/registrasi.dart';
import 'package:rekomendasi/pages/navbar.dart';
import 'package:rekomendasi/pages/navbar_admin.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
} // Fungsi yang akan dipanggil ketika aplikasi dijalankan

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    return GetMaterialApp(
      title: 'My App',
      initialRoute: '/', // Ketika aplikasi dibuka maka akan langsung membuka rute '/' atau login
      routes: {
        '/': (context) => Login(), // Rute ke login
        '/register': (context) => Registrasi(), // Rute ke registrasi
        '/home': (context) => Navbar(), // Rute ke navbar atau home pengguna
        '/admin': (context) => NavbarAdmin(), // Rute ke navbar atau home admin
      },
    );
  }
}
