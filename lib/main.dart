import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'componentes/agregar_nueva_tarjeta.dart';
import 'componentes/solicitar_credito.dart';
import 'screens/home_screen.dart';
import 'views/forgot.view.dart';
import 'views/login.view.dart';
import 'views/register.view.dart';
import 'views/splash.view.dart';
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
      initialRoute: 'LoginView',
      routes: {
        '/': (context) => const SplashView(),
        'LoginView': (context) => LoginView(),
        'ForgotView': (context) => ForgotView(),
        'RegisterView': (context) => RegisterView(),
        'AvisoPrivacidad': (context) => const AvisoPrivacidad(),
        'HomeScreen': (context) => const HomeScreen(),
        'CreditCardPage': (context) => const CreditCardPage(),
        'SolicitarCredito': (context) => SolicitarCredito(),
      },
    );
  }
}
