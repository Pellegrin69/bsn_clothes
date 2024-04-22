import 'package:bsn_clothes/features/app/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:bsn_clothes/screens/login.dart';
import 'package:bsn_clothes/screens/home.dart';
import 'package:bsn_clothes/screens/product.dart';
import 'package:bsn_clothes/screens/form.dart';

import 'package:firebase_core/firebase_core.dart';
import 'features/user_auth/presentation/pages/login_page.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BSN Clothes',
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
