import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/caixa_de_usuario.dart';
import 'package:omni_chat_telas_novas/components/foto_usuario.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/components/my_app_bar_custom.dart';
import 'package:omni_chat_telas_novas/components/nome_agente_cadastro.dart';
import 'package:omni_chat_telas_novas/components/nome_agente_colunas.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';
import 'package:omni_chat_telas_novas/helper/simular_banco_dados.dart';

import '../constants_cores.dart';

class CadastroAgente extends StatefulWidget {
  CadastroAgente({Key? key, required this.screen}) : super(key: key);

  bool screen;

  @override
  _CadastroAgenteState createState() => _CadastroAgenteState();
}

double larguraTelaGlobal = 0.0;
double alturaTelaGlobal = 0.0;
double alturaAppBarGlobal = 0.0;

BancoDadosSimulado bancoDadosSimulado = BancoDadosSimulado();

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
  NomeDoAgente screenNomedoAgente = NomeDoAgente();

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

    larguraTelaGlobal = larguraTela;
    alturaTelaGlobal = alturaTela;

    alturaAppBarGlobal = alturaAppBar;

    bool tela = widget.screen;

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
                        tipo: true,
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
                                          alignment: Alignment.topLeft,
                                          width: constraints.maxWidth,
                                          //color: Colors.red,
                                          height: constraints.maxHeight * 0.08,
                                          child: IconButton(
                                              icon: Icon(Icons.arrow_back,
                                                  color: corBlueGrey),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
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
                                            //Aqui
                                            child: tela
                                                ? screenNomedoAgente
                                                    .ListaNomeAgente(
                                                        constraints,
                                                        _tabController,
                                                        bancoDadosSimulado,
                                                        alturaAppBar)
                                                : NomeAgenteCadastro(
                                                    constraints: constraints),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                          top: (constraints.maxHeight * 0.02) /
                                              2,
                                          left: constraints.maxWidth * 0.1),
                                      height: constraints.maxHeight * 0.12,
                                      width: constraints.maxWidth * 0.8,
                                      decoration: BoxDecoration(
                                          color: corBlueGrey,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15))),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            tela
                                                ? Icons.arrow_back
                                                : Icons.flag,
                                            color: corBranca,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              tela
                                                  ? "Transferir Atendimento"
                                                  : "Lembrete de Retorno",
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
