import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas/components/BotoesBaixo.dart';
import 'package:omni_chat_telas/components/MyAppBarCustom.dart';
import 'package:omni_chat_telas/components/nomes_botoes_textos.dart';

class RamalScren extends StatefulWidget {
  static const String id = 'ramal_screen';

  @override
  _RamalScrenState createState() => _RamalScrenState();
}

double larguraTelaGlobal;
double alturaTelaGlobal;

class _RamalScrenState extends State<RamalScren> with TickerProviderStateMixin {
  TabController _tabController;

  int _onOffAtender = -1;
  int _onOffLigar = -1;
  int _onOffDTMF = -1;
  int _onOffCam = -1;
  int _onOffEspera = -1;
  int _onOffMute = -1;
  int _onOffConsultar = -1;
  int _onOffTransferir = -1;
  int _onOffCancelar = -1;
  int _onOffConf = -1;
  int _onOffDesRegistrar = -1;
  int _onOffPausa = -1;
  int _onOffLogin = -1;

  Widget _buildButton(String name, int estado, double largura, double altura) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              estado = estado * (-1);
              switch (name) {
                case NomesETextos.ramal_botao_atender:
                  return _onOffAtender = estado;
                case NomesETextos.ramal_botao_ligar:
                  return _onOffLigar = estado;
                case NomesETextos.ramal_botao_Dtmf:
                  return _onOffDTMF = estado;
                case NomesETextos.ramal_botao_cam:
                  return _onOffCam = estado;
                case NomesETextos.ramal_botao_espera:
                  return _onOffEspera = estado;
                case NomesETextos.ramal_botao_mute:
                  return _onOffMute = estado;
                case NomesETextos.ramal_botao_consultar:
                  return _onOffConsultar = estado;
                case NomesETextos.ramal_botao_transferir:
                  return _onOffTransferir = estado;
                case NomesETextos.ramal_botao_cancelar:
                  return _onOffCancelar = estado;
                case NomesETextos.ramal_botao_conf:
                  return _onOffConf = estado;
                case NomesETextos.ramal_botao_desregistrar:
                  name = "REGISTRAR";
                  return _onOffDesRegistrar = estado;
                case NomesETextos.ramal_botao_login:
                  return _onOffLogin = estado;
                case NomesETextos.ramal_botao_pausa:
                  return _onOffPausa = estado;
              }
            });
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 11),
          ),
          style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all<Size>(Size(largura, altura)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color(estado == -1 ? 0xFF9e9e9e : 0xFFffa726)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                          color:
                              Color(estado == -1 ? 0xFF9e9e9e : 0xFFffa726))))),
        ),
      ),
    );
  }

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
    double alturaAppBar = alturaAppStatus + (0.13 * alturaTela);

    var appBar =
        MyAppBarCuston("chat", alturaTela, alturaAppStatus, alturaAppBar);
    double alturaTelaDisponivel = alturaTela - appBar.alturaAppBar;

    //  print(alturaTelaDisponivel);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Container(
        height: alturaTelaDisponivel,
        width: larguraTela,
        color: Colors.grey,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.05,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Container(
                        height: constraints.maxHeight * 0.88,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 32, left: 10),
                              child: Row(children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Fila",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.grey),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            color: Colors.grey[300],
                                            width: constraints.maxWidth * 0.45,
                                            height:
                                                constraints.maxHeight * 0.06,
                                            child: TextField(
                                              style:
                                                  TextStyle(color: Colors.grey),
                                              decoration: InputDecoration(
                                                  hintText: "Nome na Fila"),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.grey),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            color: Colors.grey[300],
                                            width: constraints.maxWidth * 0.45,
                                            height:
                                                constraints.maxHeight * 0.06,
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                  hintText: "Nome do Agente"),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, left: 3, top: 4),
                                  child: Container(
                                    height: constraints.maxHeight * 0.06,
                                    child: Row(
                                      children: [
                                        _buildButton(
                                            "LIGAR",
                                            _onOffLigar,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "DTMF",
                                            _onOffDTMF,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "CAM",
                                            _onOffCam,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "MUTE",
                                            _onOffMute,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 4),
                                  child: Container(
                                    height: constraints.maxHeight * 0.06,
                                    child: Row(
                                      children: [
                                        _buildButton(
                                            "ATENDER",
                                            _onOffAtender,
                                            constraints.maxWidth * 0.5,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "ESPERA",
                                            _onOffEspera,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "CONSULTAR",
                                            _onOffConsultar,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 4),
                                  child: Container(
                                    height: constraints.maxHeight * 0.06,
                                    child: Row(
                                      children: [
                                        _buildButton(
                                            "TRANSFERIR",
                                            _onOffTransferir,
                                            constraints.maxWidth * 0.5,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "CANCELAR",
                                            _onOffCancelar,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04),
                                        _buildButton(
                                            "CONF",
                                            _onOffConf,
                                            constraints.maxWidth * 0.3,
                                            constraints.maxHeight * 0.04)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8, top: 3),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: Container(
                                            height:
                                                constraints.maxHeight * 0.08,
                                            width: constraints.maxWidth * 0.7,
                                            color: Colors.grey,
                                            child: TabBar(
                                                unselectedLabelColor:
                                                    Colors.white,
                                                controller: _tabController,
                                                indicator: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft: Radius
                                                                .circular(20)),
                                                    color: Colors.orange),
                                                labelColor: Colors.white,
                                                tabs: [
                                                  Tab(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("HOME"),
                                                    ),
                                                  ),
                                                  Tab(
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text("HISTÓRICO"),
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 3)),
                                        child: TabBarView(
                                            controller: _tabController,
                                            children: [
                                              Text("Home",
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              Text("Histórico",
                                                  style: TextStyle(
                                                      color: Colors.black))
                                            ])),
                                  ),
                                )
                              ],
                            )),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  _buildButton(
                                      "DESREGISTRAR",
                                      _onOffDesRegistrar,
                                      constraints.maxWidth * 0.5,
                                      constraints.maxHeight * 0.04),
                                  _buildButton(
                                      "LOGIN",
                                      _onOffLogin,
                                      constraints.maxWidth * 0.3,
                                      constraints.maxHeight * 0.04),
                                  _buildButton(
                                      "PAUSA",
                                      _onOffPausa,
                                      constraints.maxWidth * 0.3,
                                      constraints.maxHeight * 0.04),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey,
                    height: constraints.maxHeight * 0.07,
                    child: Row(
                      children: <Widget>[
                        ItemBotaoBaixo(
                            alturaTela, Colors.white, Icons.group_add),
                        ItemBotaoBaixo(alturaTela, Colors.white, Icons.people),
                        Expanded(
                            child: SizedBox(
                          width: 50,
                        )),
                        ItemBotaoBaixo(alturaTela, Colors.white, Icons.call),
                        ItemBotaoBaixo(alturaTela, Colors.white, Icons.pause),
                      ],
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, left: 20, right: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Container(
                        height: constraints.maxHeight * 0.09,
                        color: Colors.blueGrey,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 6, left: 16),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    
                                    child: Container(
                                      color: Colors.green,
                                      height: constraints.maxHeight * 0.04,
                                      width: constraints.maxHeight * 0.04,

                                    ),
                                  ),
                                  Text(
                                    "Ramal: 000",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    "0000",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    "00:00:00",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
