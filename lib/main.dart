import 'package:flutter/material.dart';
import 'package:login/Screen/inbox_screen.dart';
import 'package:login/Screen/myprofile_screen.dart';
import 'package:login/Screen/otp_screen.dart';
import 'package:login/Screen/outbox_screen.dart';
import 'package:login/Screen/signin_screen.dart';
import 'package:login/Screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // //Initial Route
      // initialRoute: '/',
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/otp': (context) => const OtpScreen(),
        '/inbox': (context) => const InboxScreen(),
        '/outbox': (context) => const RequstScreen(),
        '/myprofile': (context) => const MyProfilePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SafeArea(child: const SignInScreen()),
    );
  }
}
