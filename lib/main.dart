import 'package:bsn_clothes/widgets/splash_screen.dart';

import 'package:bsn_clothes/screens/signup.dart';
import 'package:bsn_clothes/screens/form.dart';
import 'package:bsn_clothes/screens/home.dart';
import 'package:bsn_clothes/screens/login.dart';
import 'package:bsn_clothes/screens/product.dart';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BSN Clothes',
      routes: {
        '/': (context) => const SplashScreen(
              child: LoginPage(),
            ),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/product': (context) => const ProductPage(),
        '/form': (context) => const FormPage(),
      },
    );
  }
}
