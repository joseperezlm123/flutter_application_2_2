import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/views/login.view.dart';
import 'package:get/get.dart';

import '../screens/global.colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Image.asset(
          'assets/images/exitus1.png',
          width: 80,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
