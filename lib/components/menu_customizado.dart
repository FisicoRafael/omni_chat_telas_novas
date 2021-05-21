import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omni_chat_telas_novas/constants_cores.dart';

class MenuCustom extends StatefulWidget {
  List<String> listaMenu;

  MenuCustom({Key? key, required this.listaMenu}) : super(key: key);

  @override
  State<MenuCustom> createState() => _MenuCustomState();
}

class _MenuCustomState extends State<MenuCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0, end: 150).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.listaMenu.insert(0, "Solicitar pausa para:");

    return Material(
        child: Container(
          width: animation.value,
          height: animation.value,
          decoration: BoxDecoration(
              color: corBranca,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(color: corPreto, spreadRadius: 1)
              ]),
          child: Column(
            children: [
              Container(child: Text(widget.listaMenu[0]),)
            ],
          ),
        ));
  }
}
