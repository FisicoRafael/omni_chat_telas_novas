import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/caixa_de_usuario.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/components/my_app_bar_custom.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';

import '../constants_cores.dart';

class CadastroAgente extends StatefulWidget {
  const CadastroAgente({Key? key}) : super(key: key);

  @override
  _CadastroAgenteState createState() => _CadastroAgenteState();
}

double larguraTelaGlobal = 0.0;
double alturaTelaGlobal = 0.0;
double alturaAppBarGlobal = 0.0;

class _CadastroAgenteState extends State<CadastroAgente> {
  List<String> listaMenu = [
    "Almoço",
    "Back Office",
    "Banheiro",
    "Café",
    "Demostração",
    "Particular"
  ];

  @override
  Widget build(BuildContext context) {
     double alturaAppStatus = MediaQuery
        .of(context)
        .padding
        .top;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaAppBar = (0.13 * alturaTela) + alturaAppStatus;

    alturaAppBarGlobal = alturaAppBar;

    double alturaTelaDisponivel = alturaTela - alturaAppBar;

    return AnimatedBuilder(
        animation: EstadoMenuAtendimento.instance,
        builder: (context, child) {
          return Material(
            color: corBranca,
            child: Stack(
              children: [
                Column(
                  children: [
                    MyAppBarCuston(
                        tipo: false,
                        alturaTela: alturaTela,
                        alturaAppBar: alturaAppBar,
                        listaMenu: listaMenu),
                    Container(
                      width: larguraTela,
                      height: alturaTelaDisponivel,
                      child: LayoutBuilder(
                        builder: (BuildContext context,
                            BoxConstraints constraints) {
                          return Column(
                            children: [
                              CaixaUsuario().caixaUsuario(),
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/bg_chat.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * 0.1,
                                      ),
                                      Container(
                                        height: constraints.maxHeight*0.8,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                topLeft:
                                                    Radius.circular(15))),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
                EstadoMenuAtendimento.instance.showMenu
                    ? Positioned(
                        right: larguraTela * 0.07,
                        top: alturaAppBar * 0.9,
                        child: MenuCustom(listaMenu: listaMenu))
                    : Container()
              ],
            ),
          );
        });
  }
}