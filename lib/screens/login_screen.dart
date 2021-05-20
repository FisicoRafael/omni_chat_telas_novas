import 'package:flutter/material.dart';

import 'chats_recebidos_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

  static const String id = 'login_screen';
}

class _LoginScreenState extends State<LoginScreen> {
  Widget _campoTexto(
      String labelHint, IconData icone, TextInputType tipoTexto) {
    bool esconderTexto = (labelHint == 'Enter your password.' ? true : false);

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 2, color: Colors.grey))),
          child: TextField(
            obscureText: esconderTexto,
            style: TextStyle(color: Colors.black),
            keyboardType: tipoTexto,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icone,
                color: Colors.grey,
              ),
              hintText: labelHint,
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
              //   contentPadding:
              //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              //   border: OutlineInputBorder(borderSide: BorderSide()),
              //   //borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //
              //   enabledBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.white, width: 1.0),
              //     //borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //   ),
              //   focusedBorder: OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.white, width: 2.0),
              //     // borderRadius: BorderRadius.all(Radius.circular(32.0)),
              //   ),
              // )
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: altura,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                      'images/logo_fundo.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.3), BlendMode.dstATop))),
          ),
          SingleChildScrollView(
            child: Container(
              height: altura,
              width: largura,
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.1,
                      child: Image.asset('images/logo-lhtec.png'),
                    ),
                    Container(
                      height: constraints.maxHeight * 0.1,
                    ),
                    _campoTexto('Enter yoir email', Icons.person,
                        TextInputType.emailAddress),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    _campoTexto(
                        'Enter your password.', Icons.lock, TextInputType.text),
                    Container(
                      height: constraints.maxHeight * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ChatsRecebidosScreen.id);
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[700],
                            minimumSize: Size(constraints.maxWidth * 0.6,
                                constraints.maxHeight * 0.07)),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
