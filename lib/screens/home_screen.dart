import 'package:flutter/material.dart';

import 'background.dart';
import '../views/widgets/card_table.dart';
import 'custom_bottom_navigation.dart';
import '../views/widgets/page_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          const Background(),
          //HomeBody
          _HomeBody()
        ],
      ),
      bottomNavigationBar: const CustomBottom(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        // Titulos
        PageTitle(),
        // Card Table
        const CardTable(),
      ]),
    );
  }
}
