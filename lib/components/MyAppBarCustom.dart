import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FotoUsuario.dart';

class MyAppBarCuston extends StatelessWidget implements PreferredSizeWidget {
  String tipo;
  double alturaTela;
  double alturaAppBar;
  double alturaAppStatus;

  MyAppBarCuston(
    this.tipo,
    this.alturaTela,
    this.alturaAppStatus,
    this.alturaAppBar, {
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(alturaTela);

  var imagem = Image.asset('images/logo-lhtec.png');

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaImagem = preferredSize.height * 0.05;
    double alturaRow = preferredSize.height * 0.08;

    if (tipo == "listaChat") {
      return Container(
        height: alturaAppBar,
        width: larguraTela,
        color: Colors.grey[200],
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: alturaAppStatus,
              ),
              Container(height: alturaImagem, child: imagem),
              Container(
                height: alturaRow,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      FotoUsuario(Icons.person),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Expanded(child: SizedBox()),
                            Text(
                              "Nome do Agente",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text("00:00:00",
                                style: TextStyle(color: Colors.black)),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: alturaAppBar,
        width: larguraTela,
        color: Colors.grey[200],
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: alturaAppStatus,
              ),
              Container(height: alturaImagem, child: imagem),
              Container(
                height: alturaRow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    FotoUsuario(Icons.person),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Expanded(child: SizedBox()),
                          Text(
                            "Nome do Agente",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text("00:00:00", style: TextStyle(color: Colors.black)),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                    Expanded(child: SizedBox())
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
