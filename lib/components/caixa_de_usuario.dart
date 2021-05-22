

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants_cores.dart';

class CaixaUsuario {

  ClipRRect caixaUsuario() {
    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius:
            BorderRadius.only(topRight: const Radius.circular(40))),
        child: Expanded(
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.orange),
                  child: Icon(
                    Icons.add_ic_call_outlined,
                    color: corBranca,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Atendimento na Fila: nome da Fila",
                        style: TextStyle(color: corBranca)),
                    Row(
                      children: [
                        Text(
                          "Nome do Contato ",
                          style: TextStyle(fontSize: 18, color: corBranca),
                        ),
                        Text(
                          " está digitando...",
                          style: TextStyle(color: corBranca),
                        ),
                      ],
                    ),
                    Text('Ticket: #09080787',
                        style: TextStyle(color: corBranca)),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

}