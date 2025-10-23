import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Common/Login&SignUP%20Screen/login&signup_common_screen.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LoginSignupCommonScreen(buttontext: 'Sign Up')),
    );
  }
}
