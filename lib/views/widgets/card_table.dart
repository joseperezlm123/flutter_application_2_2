import 'package:flutter/material.dart';

import 'dart:ui';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, 'LoginView'),
            },
            child: const _SingleCard(
              color: Colors.blue,
              icon: Icons.person,
              text: 'Transferencias',
            ),
          ),
          GestureDetector(
            onTap: () => {Navigator.pushNamed(context, 'CreditCardPage')},
            child: const _SingleCard(
              color: Colors.amber,
              icon: Icons.card_giftcard,
              text: 'Tarjetas',
            ),
          ),
        ]),
        TableRow(children: [
          GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, 'SolicitarCredito'),
            },
            child: _SingleCard(
              color: Colors.red,
              icon: Icons.border_all,
              text: 'SolicitarCredito',
            ),
          ),
          GestureDetector(
            onTap: () => {},
            child: _SingleCard(
              color: Colors.purple,
              icon: Icons.card_giftcard,
              text: 'Tranferencias',
            ),
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.green,
            icon: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.orange,
            icon: Icons.card_giftcard,
            text: 'Tranferencias',
          ),
        ]),
        TableRow(children: [
          _SingleCard(
            color: Colors.black,
            icon: Icons.border_all,
            text: 'General',
          ),
          _SingleCard(
            color: Colors.pinkAccent,
            icon: Icons.card_giftcard,
            text: 'Tranferencias',
          ),
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard(
      {super.key, required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: this.color,
            child: Icon(
              Icons.abc_sharp,
              size: 35,
              color: Colors.white,
            ),
            radius: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            this.text,
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          )
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;

  const _CardBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(75, 120, 163, 0.694),
                borderRadius: BorderRadius.circular(20)),
            child: this.child,
          ),
        ),
      ),
    );
  }
}
