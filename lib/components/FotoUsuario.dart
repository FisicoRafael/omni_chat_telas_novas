import 'package:flutter/material.dart';

class FotoUsuario extends StatelessWidget {

  IconData icone;

  FotoUsuario(this.icone);

  @override
  Widget build(BuildContext context) {

    double alturaTela = MediaQuery.of(context).size.height ;

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
          color: Colors.white,
          child: Icon(
            icone,
            size: alturaTela*0.06,
            color: Colors.grey,
          )),
    );
  }
}
