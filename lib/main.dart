import 'package:flutter/material.dart';
import 'package:flutter_application_2_2/views/prueba.get.dart';
import 'package:flutter_application_2_2/views/prueba.put.dart';
import 'package:flutter_application_2_2/views/verificate_acount_imagen2.dart';
import 'package:get/get.dart';
import 'componentes/agregar_nueva_tarjeta.dart';
import 'componentes/solicitar_credito.dart';
import 'screens/home_screen.dart';
import 'views/forgot.view.dart';
import 'views/login.view.dart';
import 'views/phone_verify.dart';
import 'views/register.view.dart';
import 'views/splash.view.dart';
import 'views/verificate_acount_image.dart';
import 'views/verification_phone.dart';
import 'views/verify_code_email.dart';
import 'views/verify_page.dart';
import 'views/widgets/aviso_privacidad.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter LoginPage',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: 'PhoneVerifyPage',
      routes: {
        '/': (context) => const SplashView(),
        'LoginView': (context) => LoginView(),
        'ForgotView': (context) => ForgotView(),
        'RegisterView': (context) => RegisterView(),
        'AvisoPrivacidad': (context) => const AvisoPrivacidad(),
        'HomeScreen': (context) => const HomeScreen(),
        'CreditCardPage': (context) => const CreditCardPage(),
        'SolicitarCredito': (context) => const SolicitarCredito(),
        'VerifyPage': (context) => VerifyPage(),
        'PhoneVerifyPage': (context) => PhoneVerifyPage(),
        'OtpForm': (context) => const OtpForm(),
        'EmailForm': (context) => EmailForm(),
        'VerificateAcount': (context) => const VerificateAcount(),
        'VerificateAcount2': (context) => const VerificateAcount2(),
        'PruebaGet': (context) => const PruebaGet(),
        'PruebaPut': (context) => const PruebaPut(),
      },
    );
  }
}
