import 'package:flutter/cupertino.dart';

class EstadoMenuAtendimento extends ChangeNotifier {
  static EstadoMenuAtendimento instance = EstadoMenuAtendimento();
  bool showMenu = false;

  openMenu() {
    showMenu = !showMenu;
    notifyListeners();
  }
}
