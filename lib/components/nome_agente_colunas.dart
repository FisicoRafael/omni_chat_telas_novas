import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/helper/simular_banco_dados.dart';

import '../constants_cores.dart';
import 'foto_usuario.dart';

class NomeDoAgente {
  BancoDadosSimulado bancoDadosSimulado = BancoDadosSimulado();
  double alturaAppBar = 0.0;

  Widget ListaNomeAgente(
      BoxConstraints constraints,
      TabController _tabController,
      BancoDadosSimulado bancoDadosSimulado,
      double alturaAppBar) {
    this.bancoDadosSimulado = bancoDadosSimulado;
    this.alturaAppBar = alturaAppBar;

    return Column(
      children: [
        Container(
          height: constraints.maxHeight * 0.08,
          //color: Colors.red,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: TabBar(
              unselectedLabelColor: corCinza,
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: corBlueGrey),
              labelColor: Colors.white,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.person), Text(("Para outro Agente"))],
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            style: TextStyle(color: corPreto),
            decoration: InputDecoration(
              fillColor: corBranca,
              hintText: "Buscar Atendimento",
              hintStyle: TextStyle(color: corCinza),
              suffixIcon: Icon(
                Icons.search,
                color: corCinza,
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: bancoDadosSimulado.bancoLista.length,
                itemBuilder: this.builItem))
      ],
    );
  }

  Widget cadastroNomeAgente(BoxConstraints constraints, BuildContext context) {
    int _value = 1;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: constraints.maxHeight * 0.08,
            //color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Conta:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: constraints.maxWidth,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Data do Retorno:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: constraints.maxWidth,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Horário do Retorno:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: constraints.maxWidth,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Título do lembrete:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: constraints.maxWidth,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Mensagem de lembrete:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: constraints.maxWidth,
            height: constraints.maxHeight * 0.1,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Canal de lembrete:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(
                  child: Text("Email"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second Item"),
                  value: 2,
                ),
                DropdownMenuItem(child: Text("Third Item"), value: 3),
                DropdownMenuItem(child: Text("Fourth Item"), value: 4)
              ],
              onChanged: (value) {
                _value = _value;
              }),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text("Salvar"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Cancelar"),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget builItem(context, index) {
    var valorBanco = bancoDadosSimulado.bancoLista[index];

    return ListTile(
      title: Text(
        valorBanco["titulo"],
        style: TextStyle(
            color: corPreto, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      leading: FotoUsuario(
        alturaAppBar: alturaAppBar * 0.3,
        icone: Icons.person,
      ),
    );
  }
}
