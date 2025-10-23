import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Common/Login&SignUP%20Screen/login&signup_common_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginSignupCommonScreen(buttontext: 'Login')),
    );
  }
}
