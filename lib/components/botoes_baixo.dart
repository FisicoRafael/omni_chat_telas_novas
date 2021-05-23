import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';

class ItemBotaoBaixo extends StatelessWidget {
  double alturaTela = 0.0;
  Color cor = corBranca;
  IconData icone = Icons.person;

  ItemBotaoBaixo(
      {String? texto,
      required this.alturaTela,
      required this.cor,
      required this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: IconButton(
        icon: Icon(
          icone,
          color: cor,
          size: alturaTela * 0.04,
        ),
        onPressed: () {},
      ),
    );
  }
}
