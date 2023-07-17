import 'package:better_half/const/app_color.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset('assets/icons/Bettter Half.png'),
      ),
    );
  }
}