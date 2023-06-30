import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/views/login.view.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://exituscredit.com/img/logo_exitus-1.a984fa37.png',
          height: 80,
        ),
      ),
    );
  }
}
