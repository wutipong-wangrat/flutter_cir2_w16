import 'package:flutter/material.dart';

import 'lib/screens/contact.dart';
import 'lib/screens/first_screen.dart';
import 'lib/screens/future_screen.dart';
import 'lib/screens/home.dart';
import 'lib/screens/login.dart';
import 'lib/screens/profile.dart';
import 'lib/screens/stream_screen.dart';
import 'lib/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen()
      initialRoute: '/splash',
      routes: {
        '/': (context) => const HomeScreen(),
        '/splash':(context) => SplashScreen(),
        FirstScreen.id: (context) => const FirstScreen(),
        ContactScreen.id: (context) => const ContactScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        FutureScreen.id:(context) => const FutureScreen(),
        StreamScreen.id:(context) => StreamScreen(),
      },
    );
  }
}