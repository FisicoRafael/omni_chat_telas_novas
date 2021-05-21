import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/components/menu_customizado.dart';
import 'package:omni_chat_telas_novas/components/my_app_bar_custom.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';
import 'package:omni_chat_telas_novas/helper/estados.dart';

class EmAtendimento extends StatefulWidget {
  const EmAtendimento({Key? key})
      : super(
          key: key,
        );

  @override
  State<EmAtendimento> createState() => _EmAtendimentoState();
}

class _EmAtendimentoState extends State<EmAtendimento> {
  @override
  Widget build(BuildContext context) {
    double alturaAppStatus = MediaQuery.of(context).padding.top;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double alturaAppBar = alturaAppStatus + (0.13 * alturaTela);

    List<String> listaMenu = ["Almoço", "Back Office"];

    double alturaTelaDisponivel = alturaTela;
    print(EstadoMenuAtendimento.instance.showMenu);

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
                        alturaAppStatus: alturaAppStatus,
                        listaMenu: listaMenu)
                  ],
                ),
                EstadoMenuAtendimento.instance.showMenu
                    ? Positioned(
                        right: larguraTela*0.07,
                        top: alturaAppBar*0.9,
                        child: MenuCustom(listaMenu: listaMenu))
                    : Container()
              ],
            ),
          );
        });
  }
}
