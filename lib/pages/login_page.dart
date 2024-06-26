import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import statement
import 'package:skincare/pages/my_button.dart';
import 'package:skincare/pages/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController(); //ngambil data username
  final passwordController = TextEditingController(); //ngambil data password

  void signUserIn(BuildContext context) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  void registerNow(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/register');
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
              // const SizedBox(height: 25),
              //Logo
              Icon(
                Icons.lock,
                size: screenSize.width * 0.2,
                color: const Color(0xff925857),
              ),

              SizedBox(height: screenSize.height * 0.05),

              //Text Login
              Text(
                'LOGIN',
                style: GoogleFonts.poppins(
                  color: const Color(0xff925857),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: screenSize.height * 0.05),

              //Username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              SizedBox(height: screenSize.height * 0.01),

              //Password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              SizedBox(height: screenSize.height * 0.05),

              //Sign In button
              MyButton(
                onTap: () => signUserIn(context),
                text: 'Sign In',
                backColor: 0xff925857,
                textColor: 0xFFFFFFFF,
              ),

              SizedBox(height: screenSize.height * 0.05),

              //Not a member
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

              SizedBox(height: screenSize.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
