import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rekomendasi/pages/navbar.dart';
import 'package:rekomendasi/pages/navbar_admin.dart';
import 'package:rekomendasi/pages/my_text_field.dart';
import 'package:rekomendasi/pages/my_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void registerNow(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/register');
  }

  Future<void> signIn(BuildContext context) async {
    // future : fungsi di masa depan yang tidak mengembalikan nilai
    // async : apat menunggu operasi lambat tanpa menghentikan eksekusi program
    // context : dapat membagikan informasi ke widget tree
    final String username = _username.text;
    final String password = _password.text;

    final Uri loginUrl = Uri.parse('http://10.0.2.2:5000/login');
    // meminta permintaan HTTP ke URL 
    // uri : mengidentifikasi sumber daya
    // parse : menguraikan data menjadi bahasa yang dipahami program

    try {
      final response = await http.post(
        loginUrl,
        headers: {'Content-Type': 'application/json'},
        // headers : permintaan informasi tambahan
        // content-type : entitas body yang dikirim dalam bentuk json
        body: jsonEncode({'username': username, 'password': password}),
        // encode : mengubah dari Dart ke Json
      );

if (response.statusCode == 200) {
  // jika status code nya berhasil
  final jsonData = jsonDecode(response.body);
  // decode : mengubah dari Json
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // shared preferences : membagikan preferences atau values
  sharedPreferences.setString('username', _username.text);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text(jsonData['message']),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // menutup dialog
              if (username == 'admin') {
                Get.to(NavbarAdmin(), arguments: username);
              } else {
                Get.to(Navbar(), arguments: username);
              }
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to login: ${response.reasonPhrase}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold( // widget utama
      backgroundColor: const Color(0xfffde1e1),
      body: SafeArea(
        child: Center( // agar di tengah
          child: Column( // tata letak vertikal atau ke bawah
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: screenSize.width * 0.2,
                color: const Color(0xff925857),
              ),
              SizedBox(height: screenSize.height * 0.05),
              Text(
                'LOGIN',
                style: GoogleFonts.poppins(
                  color: const Color(0xff925857),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenSize.height * 0.05),
              MyTextField(
                controller: _username,
                hintText: 'Username',
                obsecureText: false,
              ),

              SizedBox(height: screenSize.height * 0.01),

              MyTextField(
                controller: _password,
                hintText: 'Password',
                obsecureText: true,
              ),

              SizedBox(height: screenSize.height * 0.05),

              MyButton(
                onTap: () => signIn(context),
                text: 'Sign In',
                backColor: 0xff925857,
                textColor: 0xFFFFFFFF,
              ),
              SizedBox(height: screenSize.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.poppins(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => registerNow(context),
                    child: const Text(
                      'Register Now!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
