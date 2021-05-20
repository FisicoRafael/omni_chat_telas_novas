import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:omni_chat_telas/components/BotoesBaixo.dart';
import 'package:omni_chat_telas/components/FotoUsuario.dart';
import 'package:omni_chat_telas/components/MyAppBarCustom.dart';

import 'chat_screen.dart';

class ChatsRecebidosScreen extends StatefulWidget {
  @override
  _ChatsRecebidosScreenState createState() => _ChatsRecebidosScreenState();

  static const String id = 'chats_recebidos_screen';
}

BuildContext context_aux;
double alturaGlobalTela;

class _ChatsRecebidosScreenState extends State<ChatsRecebidosScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

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
        MyAppBarCuston("listaChat", alturaTela, alturaAppStatus, alturaAppBar);
    double alturaTelaDisponivel = alturaTela - alturaAppBar;

    alturaGlobalTela = alturaTelaDisponivel;

    context_aux = context;
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: alturaTelaDisponivel,
        width: larguraTela,
        color: Colors.blueGrey,
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: <Widget>[
              TabBar(
                  unselectedLabelColor: Colors.white,
                  controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                      color: Colors.white),
                  labelColor: Colors.lightGreenAccent[400],
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(Icons.group_add),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Em Atendimento"),
                          )
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Icon(Icons.people),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Internos"),
                          )
                        ],
                      ),
                    ),
                  ]),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Buscar Atendimento",
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: lista_tab_1.length,
                              itemBuilder: _listaChats_tab_1),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Buscar Contato",
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: lista_tab_2.length,
                              itemBuilder: _listaChats_tab_2),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.07,
                color: Colors.blueGrey,
                child: Row(
                  children: [
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
          );
        }),
      ),
    );
  }
}

List<ListTile> lista_tab_1 = [
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text(
          "Texto checado",
          style: TextStyle(color: Colors.black),
        )
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text(
          "00:00:00",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: alturaGlobalTela * 0.035,
                  height: alturaGlobalTela * 0.035,
                  color: Colors.lightGreenAccent[400],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text(
          "00:00:00",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: alturaGlobalTela * 0.035,
                  height: alturaGlobalTela * 0.035,
                  color: Colors.lightGreenAccent[400],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text(
          "00:00:00",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: alturaGlobalTela * 0.035,
                  height: alturaGlobalTela * 0.035,
                  color: Colors.lightGreenAccent[400],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text(
          "00:00:00",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: alturaGlobalTela * 0.035,
                  height: alturaGlobalTela * 0.035,
                  color: Colors.lightGreenAccent[400],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    trailing: Column(
      children: [
        Text(
          "00:00:00",
          style: TextStyle(color: Colors.black),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: alturaGlobalTela * 0.035,
                  height: alturaGlobalTela * 0.035,
                  color: Colors.lightGreenAccent[400],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  )
];

List<ListTile> lista_tab_2 = [
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text(
          "Texto checado",
          style: TextStyle(color: Colors.black),
        )
      ],
    ),
    leading: FotoUsuario(Icons.person),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  ),
  ListTile(
    title: new Text('CineArts at the Empire',
        style: new TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black)),
    subtitle: Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.black,
        ),
        Text("Texto checado", style: TextStyle(color: Colors.black))
      ],
    ),
    leading: FotoUsuario(Icons.person),
    onTap: () {
      Navigator.pushNamed(context_aux, ChatScreen.id);
    },
  )
];

Widget _listaChats_tab_1(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black45))),
        child: lista_tab_1[index]),
  );
}

Widget _listaChats_tab_2(BuildContext context, int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black45))),
        child: lista_tab_2[index]),
  );
}
