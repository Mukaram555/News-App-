import 'package:flutter/material.dart';
import 'package:news_app/SRC/Presentation/Common/common_ui.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonUi(buttontext: 'Sign Up'));
  }
}
