import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:skincare/firebase_options.dart';
import 'package:skincare/pages/auth_page.dart';
import 'package:skincare/pages/register_page.dart';
import 'pages/login_page.dart';
import 'package:skincare/pages/navbar_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fix super(key: key)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute:
          '/', // Initial route, in this case, will point to the login page
      routes: {
        '/': (context) => AuthPage(), // Route for the login page
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/admin': (context) =>
            NavbarAdmin(), // Route for the home page (added comma)
      },
    );
  }
}
