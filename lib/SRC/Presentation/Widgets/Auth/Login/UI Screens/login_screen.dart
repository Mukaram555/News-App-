import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Common/common_ui.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonUi(buttontext: 'Login'));
  }
}
