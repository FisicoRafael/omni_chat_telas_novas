import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants_cores.dart';

class NomeAgenteCadastro extends StatefulWidget {
  NomeAgenteCadastro({Key? key, required this.constraints}) : super(key: key);

  BoxConstraints constraints;

  @override
  _NomeAgenteCadastroState createState() => _NomeAgenteCadastroState();
}

class _NomeAgenteCadastroState extends State<NomeAgenteCadastro> {
  final List<String> itens = <String>['Email', 'Nome', 'Celular', 'Endereço'];
  String dropdownValue = 'Email';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: widget.constraints.maxHeight * 0.08,
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
            width: widget.constraints.maxWidth,
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
            width: widget.constraints.maxWidth,
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
            width: widget.constraints.maxWidth,
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
            width: widget.constraints.maxWidth,
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
            width: widget.constraints.maxWidth,
            height: widget.constraints.maxHeight * 0.1,
            child: TextField(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Canal de lembrete:",
              style: TextStyle(color: corCinza700),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: widget.constraints.maxWidth,
              child: FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        style: TextStyle(color: corPreto),
                        isDense: true,
                        items: itens.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        value: dropdownValue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                  ),
                );
              })),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 2),
                    color: corBlueGrey,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check,color: corBranca,),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "Salvar",
                              style: TextStyle(color: corBranca),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 2),
                    color: corBlueGrey,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.cancel,color: corBranca,),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "Cancelar",
                              style: TextStyle(color: corBranca),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
