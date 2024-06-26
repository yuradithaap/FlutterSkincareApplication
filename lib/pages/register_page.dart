import 'package:flutter/material.dart';
import 'package:skincare/pages/my_button.dart';
import 'package:skincare/pages/my_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void login(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
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
                controller: emailController,
                hintText: 'Email',
                obsecureText: false,
              ),

              SizedBox(height: screenSize.height * 0.01),

              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              SizedBox(height: screenSize.height * 0.01),

              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obsecureText: true,
              ),

              SizedBox(height: screenSize.height * 0.05),

              MyButton(
                onTap: () => login(context),
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
