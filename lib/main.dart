import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gehu/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print()
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF3EBACE),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFD8ECF1)),
      ),
      home: (prefs.getBool('skipped') ?? false) ||
              (prefs.getBool('isAdmin') ?? false)
          ? const HomeScreen()
          : const LoginScreen(),
      // home: const LoginScreen(),
    );
  }
}
