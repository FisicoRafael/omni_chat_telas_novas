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

class _CadastroAgenteState extends State<CadastroAgente>
    with TickerProviderStateMixin {
  List<String> listaMenu = [
    "Almoço",
    "Back Office",
    "Banheiro",
    "Café",
    "Demostração",
    "Particular"
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double alturaAppStatus = MediaQuery.of(context).padding.top;
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
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Column(
                            children: [
                              CaixaUsuario().caixaUsuario(),
                              Expanded(
                                child: Stack(
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
                                        Container(
                                          //color: Colors.red,
                                          height: constraints.maxHeight * 0.08,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: corBranca,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    topLeft:
                                                        Radius.circular(15))),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height:
                                                      constraints.maxHeight *
                                                          0.08,
                                                  color: Colors.red,
                                                ),
                                                TabBar(
                                                    unselectedLabelColor: corCinza,
                                                    controller: _tabController,
                                                    indicator: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20)),
                                                        color: corBlueGrey),
                                                    labelColor: Colors.white,
                                                    tabs: [
                                                      Tab(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.person),
                                                            Text(("Para outro Agente"))
                                                          ],
                                                        ),
                                                      ),
                                                      Tab(
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.account_tree_rounded),
                                                            Text(("Para uma Fila"))
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: (constraints.maxHeight * 0.02) /
                                              2,
                                          left: constraints.maxWidth * 0.05),
                                      height: constraints.maxHeight * 0.12,
                                      width: constraints.maxWidth * 0.89,
                                      decoration: BoxDecoration(
                                          color: corBlueGrey,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.arrow_back,
                                            color: corBranca,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              "Transferir Atendimento",
                                              style: TextStyle(
                                                  color: corBranca,
                                                  fontSize: 20),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
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
