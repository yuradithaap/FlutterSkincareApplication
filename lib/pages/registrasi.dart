import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rekomendasi/pages/login.dart';
import 'package:rekomendasi/pages/my_button.dart';
import 'package:rekomendasi/pages/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrasi extends StatelessWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void login(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  Future<void> signUp(BuildContext context) async {
    final String username = _username.text;
    final String password = _password.text;

    final Uri registerUrl = Uri.parse('http://10.0.2.2:5000/register');

    try {
      final response = await http.post(
        registerUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text(jsonData['message']),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
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
              content: Text('Failed to register: ${response.reasonPhrase}'),
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

    return Scaffold(
      backgroundColor: const Color(0xfffde1e1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: screenSize.width * 0.2,
                color: const Color(0xff925857),
              ),

              SizedBox(height: screenSize.height * 0.05),

              Text(
                'REGISTER',
                style: GoogleFonts.poppins().copyWith(
                  color: const Color(0xff925857),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
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
                onTap: () => signUp(context),
                text: 'Sign Up',
                backColor: 0xff925857,
                textColor: 0xFFFFFFFF,
              ),

              SizedBox(height: screenSize.height * 0.05),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.poppins().copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => login(context),
                    child: const Text(
                      'Login Now!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
