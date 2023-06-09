import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
     showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.lightBlue,
      backgroundColor: Color.fromARGB(226, 78, 25, 25),
      unselectedItemColor: Colors.lightBlue,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_sharp),
          label: 'Tarjetas',),
          
        BottomNavigationBarItem(
          icon: Icon(Icons.circle,
          ),
          label: 'MiApp',
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.person,
          ),
          label: 'Perfil',
          ),
      ]);
  }
}