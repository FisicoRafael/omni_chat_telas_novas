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
  late List<String> listaMenuCon;

  @override
  void initState() {
    super.initState();
    listaMenuCon = widget.listaMenu;
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
          boxShadow: <BoxShadow>[BoxShadow(color: corPreto, spreadRadius: 1)]),
      child: Column(
        children: [
          Container(
            height: 30,
            child: Text("Solicitar pausa para:"),
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listaMenuCon.length,
                itemBuilder: buildItem),
          )
        ],
      ),
    ));
  }

  Widget buildItem(context, index) {
    return Container(
      height: 30,
      child: ListTile(
        title: Text(listaMenuCon[index]),
      ),
    );
  }
}
