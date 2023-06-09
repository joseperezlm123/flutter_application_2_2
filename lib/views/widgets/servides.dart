

import 'package:flutter/material.dart';

class ExitusProvider extends ChangeNotifier {

  ExitusProvider(){
    print('ExitusProvider inicializado');

    this.getOnDisplayExitus();
  }

  getOnDisplayExitus()  async {
    print('getOnDisplatExitus');
  }

}